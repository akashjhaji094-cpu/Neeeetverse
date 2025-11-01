# NEETVerse API Routes (Backend)

## Base URL
```
Production: https://api.neetverse.app
Development: http://localhost:3000
```

## Authentication Routes

### POST /api/auth/signup
**Register new user**

Request:
```json
{
  "email": "student@example.com",
  "password": "SecurePass123",
  "username": "student_2025",
  "exam": "NEET"
}
```

Response:
```json
{
  "success": true,
  "user": {
    "id": "uuid",
    "email": "student@example.com",
    "username": "student_2025",
    "exam": "NEET",
    "xp_redeemable": 50,
    "xp_referral": 0
  },
  "token": "jwt_token"
}
```

### POST /api/auth/login
**Log in existing user**

Request:
```json
{
  "email": "student@example.com",
  "password": "SecurePass123"
}
```

Response: Same as signup

### POST /api/auth/logout
**Log out user**

Response:
```json
{
  "success": true,
  "message": "Logged out"
}
```

---

## XP Routes

### GET /api/xp/balance
**Get user's current XP balances**

Response:
```json
{
  "xp_redeemable": 850,
  "xp_referral": 400,
  "xp_pending": 0,
  "xp_locked": 0,
  "xp_total": 1250
}
```

### GET /api/xp/transactions
**Get transaction history**

Query Params: `?limit=50&offset=0`

Response:
```json
{
  "transactions": [
    {
      "id": "uuid",
      "change": 6,
      "balance_after": 994,
      "reason": "doubt_post_cost",
      "timestamp": "2025-11-01T10:30:00Z"
    }
  ]
}
```

### POST /api/xp/topup/request
**Create manual UPI top-up request**

Request:
```json
{
  "amount_inr": 100,
  "upi_ref": "TXN123456789",
  "screenshot_url": "https://storage.../screenshot.jpg"
}
```

Response:
```json
{
  "success": true,
  "request_id": "uuid",
  "status": "pending",
  "message": "Request submitted. We'll verify within 1-24 hours"
}
```

### GET /api/xp/topup/history
**Get all top-up requests for user**

Response:
```json
{
  "topups": [
    {
      "id": "uuid",
      "amount_inr": 100,
      "xp_expected": 1000,
      "status": "verified",
      "verified_at": "2025-11-01T10:45:00Z"
    }
  ]
}
```

### POST /api/xp/withdraw/request
**Create withdrawal request**

Request:
```json
{
  "xp_amount": 1000,
  "upi_id": "username@bank",
  "account_holder": "Full Name"
}
```

Response:
```json
{
  "success": true,
  "withdraw_id": "uuid",
  "equivalent_inr": 100,
  "status": "pending"
}
```

---

## Marketplace Routes

### POST /api/notes/create
**Create notes listing**

Request:
```json
{
  "title": "Organic Chemistry Notes",
  "subject": "Chemistry",
  "chapter": "Organic Reactions",
  "price_xp": 250,
  "exam": ["NEET", "JEE"],
  "sample_urls": ["url1", "url2"],
  "full_link": "https://drive.google.com/...",
  "description": "Comprehensive notes..."
}
```

Response:
```json
{
  "success": true,
  "note_id": "uuid",
  "status": "pending",
  "message": "Listing created. Awaiting admin approval"
}
```

### GET /api/notes/marketplace
**Get all approved notes**

Query: `?exam=NEET&subject=Chemistry&sort=recent`

Response:
```json
{
  "notes": [
    {
      "id": "uuid",
      "title": "Organic Chemistry Notes",
      "price_xp": 250,
      "seller": "@note_maker",
      "rating": 4.8,
      "sales": 42,
      "verified_seller": true
    }
  ]
}
```

### POST /api/notes/buy
**Purchase note**

Request:
```json
{
  "note_id": "uuid"
}
```

Response:
```json
{
  "success": true,
  "purchase_id": "uuid",
  "access_link": "https://drive.google.com/...",
  "xp_deducted": 250
}
```

### POST /api/notes/:id/rate
**Rate notes**

Request:
```json
{
  "rating": 5,
  "review": "Excellent notes, very helpful!"
}
```

---

## Doubts Routes

### POST /api/doubts/create
**Post a doubt**

Request (multipart/form-data):
```
- subject: "Physics"
- chapter: "Thermodynamics"
- title: "Entropy question"
- images: [file1, file2]
- exam: "NEET"
```

Response:
```json
{
  "success": true,
  "doubt_id": "uuid",
  "cost_xp": 6,
  "xp_deducted": 6
}
```

### GET /api/doubts
**Get all doubts**

Query: `?exam=NEET&subject=Physics&sort=recent&status=open`

Response:
```json
{
  "doubts": [
    {
      "id": "uuid",
      "asker": "@student123",
      "subject": "Physics",
      "title": "Entropy",
      "image_urls": ["url1"],
      "answers_count": 3,
      "status": "open"
    }
  ]
}
```

### POST /api/doubts/:id/answer
**Post answer to doubt**

Request (multipart/form-data):
```
- text: "Solution explanation..."
- image: solution_image (optional)
```

Response:
```json
{
  "success": true,
  "answer_id": "uuid",
  "potential_reward": "+5 XP if marked correct"
}
```

### PUT /api/doubts/:id/accept-answer
**Accept an answer as correct**

Request:
```json
{
  "answer_id": "uuid"
}
```

Response:
```json
{
  "success": true,
  "answerer_id": "uuid",
  "xp_rewarded": 5
}
```

---

## Chat Routes

### GET /api/chat/rooms
**Get list of chat rooms**

Response:
```json
{
  "rooms": [
    {
      "id": "neet-general",
      "name": "NEET-General",
      "members": 234,
      "online": 45
    }
  ]
}
```

### GET /api/chat/rooms/:id/messages
**Get messages from room**

Query: `?limit=50&offset=0`

Response:
```json
{
  "messages": [
    {
      "id": "uuid",
      "user": "@student123",
      "text": "Anyone doing doubts?",
      "timestamp": "2025-11-01T10:30:00Z"
    }
  ]
}
```

### POST /api/chat/send
**Send message (WebSocket preferred)**

Request:
```json
{
  "room_id": "neet-general",
  "text": "Hello everyone!"
}
```

---

## Referral Routes

### GET /api/referrals/code
**Get referral code**

Response:
```json
{
  "code": "NEET1234",
  "share_link": "https://neetverse.app/ref/NEET1234"
}
```

### GET /api/referrals/stats
**Get referral statistics**

Response:
```json
{
  "total_referred": 12,
  "verified": 10,
  "xp_earned": 200,
  "recent": [
    {
      "username": "@friend_123",
      "referred_at": "2025-10-28",
      "status": "verified"
    }
  ]
}
```

---

## Admin Routes

### GET /api/admin/topups/pending
**Get pending top-ups (admin only)**

Response:
```json
{
  "topups": [
    {
      "id": "uuid",
      "user": "@student123",
      "amount_inr": 100,
      "xp_expected": 1000,
      "screenshot_url": "...",
      "upi_ref": "TXN123"
    }
  ]
}
```

### POST /api/admin/topups/:id/verify
**Verify and credit top-up (admin only)**

Request:
```json
{
  "verified": true,
  "note": "Payment verified from UPI app"
}
```

### POST /api/admin/users/:id/ban
**Ban user (admin only)**

Request:
```json
{
  "reason": "fraud_attempt",
  "duration_hours": 24
}
```

---

## Error Responses

### 400 Bad Request
```json
{
  "error": "Invalid request",
  "message": "XP amount must be positive"
}
```

### 401 Unauthorized
```json
{
  "error": "Unauthorized",
  "message": "Please login first"
}
```

### 403 Forbidden
```json
{
  "error": "Forbidden",
  "message": "Insufficient permissions"
}
```

### 429 Too Many Requests
```json
{
  "error": "Rate limit exceeded",
  "retry_after": 60
}
```

### 500 Server Error
```json
{
  "error": "Internal server error",
  "message": "Something went wrong. Please try again."
}
```

---

## Rate Limiting
- Standard: 100 requests/minute per user
- Auth: 5 attempts/minute
- Upload: 10 uploads/hour
- Top-up: 10 requests/day

---

**Last Updated:** November 2025
**Version:** 1.0 (MVP)
