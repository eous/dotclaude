---
name: security-checklist
description: Application security best practices and vulnerability prevention. Use when reviewing code for security issues, implementing authentication, or discussing OWASP vulnerabilities. Triggers on mentions of security, authentication, authorization, XSS, SQL injection, CSRF, OWASP, encryption, secrets.
---

# Security Checklist and Best Practices

## Input Validation

### Validate All Input
```python
# Bad - trusting user input
def get_user(user_id):
    return db.query(f"SELECT * FROM users WHERE id = {user_id}")

# Good - parameterized queries
def get_user(user_id: int):
    return db.query("SELECT * FROM users WHERE id = ?", [user_id])
```

### Sanitize Output
```python
# XSS Prevention
from markupsafe import escape

def render_comment(comment):
    return f"<div>{escape(comment)}</div>"
```

### Validate Types and Ranges
```python
from pydantic import BaseModel, Field, validator

class UserInput(BaseModel):
    age: int = Field(ge=0, le=150)
    email: str

    @validator('email')
    def validate_email(cls, v):
        if '@' not in v:
            raise ValueError('Invalid email')
        return v.lower()
```

## SQL Injection Prevention

### Parameterized Queries
```python
# Bad
cursor.execute(f"SELECT * FROM users WHERE name = '{name}'")

# Good - parameterized
cursor.execute("SELECT * FROM users WHERE name = ?", (name,))

# Good - ORM
User.objects.filter(name=name)
```

### Stored Procedures
```sql
CREATE PROCEDURE GetUserByName(IN userName VARCHAR(100))
BEGIN
    SELECT * FROM users WHERE name = userName;
END;
```

## XSS Prevention

### Content Security Policy
```
Content-Security-Policy: default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'
```

### Output Encoding
```javascript
// Bad
element.innerHTML = userInput;

// Good
element.textContent = userInput;

// React (auto-escaped)
<div>{userInput}</div>

// Dangerous (only when necessary)
<div dangerouslySetInnerHTML={{__html: sanitizedHtml}} />
```

### HTTP-Only Cookies
```python
response.set_cookie(
    'session_id',
    value=session_id,
    httponly=True,
    secure=True,
    samesite='Strict'
)
```

## CSRF Protection

### Token Validation
```python
# Generate token
csrf_token = secrets.token_urlsafe(32)
session['csrf_token'] = csrf_token

# Validate on POST
if request.form.get('csrf_token') != session.get('csrf_token'):
    abort(403)
```

### SameSite Cookies
```python
response.set_cookie('session', value, samesite='Strict')
```

## Authentication

### Password Hashing
```python
import bcrypt

# Hash password
def hash_password(password: str) -> str:
    salt = bcrypt.gensalt(rounds=12)
    return bcrypt.hashpw(password.encode(), salt).decode()

# Verify password
def verify_password(password: str, hashed: str) -> bool:
    return bcrypt.checkpw(password.encode(), hashed.encode())
```

### Rate Limiting Login
```python
from functools import wraps
from flask_limiter import Limiter

limiter = Limiter(key_func=get_remote_address)

@app.route('/login', methods=['POST'])
@limiter.limit("5 per minute")
def login():
    # ...
```

### Secure Session Management
```python
# Session configuration
app.config.update(
    SESSION_COOKIE_SECURE=True,
    SESSION_COOKIE_HTTPONLY=True,
    SESSION_COOKIE_SAMESITE='Lax',
    PERMANENT_SESSION_LIFETIME=timedelta(hours=1)
)
```

## Authorization

### Role-Based Access Control
```python
def require_role(role):
    def decorator(f):
        @wraps(f)
        def decorated(*args, **kwargs):
            if not current_user.has_role(role):
                abort(403)
            return f(*args, **kwargs)
        return decorated
    return decorator

@app.route('/admin')
@require_role('admin')
def admin_panel():
    pass
```

### Resource-Level Authorization
```python
def get_order(order_id):
    order = Order.query.get(order_id)
    if order.user_id != current_user.id:
        abort(403)
    return order
```

## Secrets Management

### Environment Variables
```python
# Bad
API_KEY = "sk_live_abc123"

# Good
import os
API_KEY = os.environ.get('API_KEY')
```

### Secret Files
```bash
# .gitignore
.env
*.pem
secrets/
credentials.json
```

### Encryption at Rest
```python
from cryptography.fernet import Fernet

# Generate key (store securely)
key = Fernet.generate_key()
cipher = Fernet(key)

# Encrypt
encrypted = cipher.encrypt(b"sensitive data")

# Decrypt
decrypted = cipher.decrypt(encrypted)
```

## HTTPS and Transport Security

### Force HTTPS
```python
# Flask
from flask_tls import ForceHTTPS
ForceHTTPS(app)

# Nginx
server {
    listen 80;
    return 301 https://$host$request_uri;
}
```

### Security Headers
```
Strict-Transport-Security: max-age=31536000; includeSubDomains
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
```

## File Upload Security

### Validate File Types
```python
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def upload_file(file):
    if not allowed_file(file.filename):
        raise ValueError("Invalid file type")

    # Use secure filename
    filename = secure_filename(file.filename)

    # Store outside web root
    file.save(os.path.join(UPLOAD_FOLDER, filename))
```

### Scan for Malware
```python
import clamd

def scan_file(file_path):
    cd = clamd.ClamdUnixSocket()
    result = cd.scan(file_path)
    if result[file_path][0] == 'FOUND':
        raise SecurityError("Malware detected")
```

## Logging and Monitoring

### Secure Logging
```python
import logging

# Don't log sensitive data
logger.info(f"User {user_id} logged in")  # Good
logger.info(f"Password: {password}")  # Bad!

# Mask sensitive fields
def mask_sensitive(data):
    if 'password' in data:
        data['password'] = '***'
    if 'credit_card' in data:
        data['credit_card'] = '****' + data['credit_card'][-4:]
    return data
```

### Audit Trail
```python
def log_audit_event(user_id, action, resource, details=None):
    AuditLog.create(
        user_id=user_id,
        action=action,
        resource=resource,
        details=details,
        ip_address=request.remote_addr,
        timestamp=datetime.utcnow()
    )
```

## Dependency Security

### Regular Updates
```bash
# Check for vulnerabilities
pip-audit
npm audit
cargo audit
```

### Pin Versions
```
# requirements.txt
django==4.2.7
requests==2.31.0
```

## OWASP Top 10 Quick Reference

1. **Broken Access Control** - Verify authorization
2. **Cryptographic Failures** - Use strong encryption
3. **Injection** - Parameterize queries
4. **Insecure Design** - Threat modeling
5. **Security Misconfiguration** - Secure defaults
6. **Vulnerable Components** - Update dependencies
7. **Auth Failures** - Strong auth mechanisms
8. **Data Integrity Failures** - Verify signatures
9. **Logging Failures** - Comprehensive logging
10. **SSRF** - Validate URLs, allowlist hosts
