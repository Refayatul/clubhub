# 🏛️ ClubHub

ClubHub is a modern, full-stack university club management and student engagement platform built with **Spring Boot 3**, **Java 21**, **Thymeleaf**, and **PostgreSQL**. It connects students, club leaders, and university administrators in a centralized social ecosystem.

---

## 🚀 Key Features

### 🎓 Students
* **Explore Clubs & Activities:** Browse registered university clubs, discover events, and view club updates.
* **Club Applications:** Apply for club membership, track application statuses, or cancel/reapply.
* **Social Feed:** Like, comment, and engage with club posts and campus announcements.
* **Personalized Dashboard & Notifications:** Real-time notifications for application approvals, comments, and interactions.

### 👥 Club Administrators
* **Club Management:** Manage club profile, member directories, and announcements.
* **Application Review:** Review, approve, or reject student membership applications.
* **Post & Media Publishing:** Create and publish rich media posts with image attachments.

### 🏫 University Administrators
* **Campus Oversight:** Manage universities, register new campus clubs, and assign club administrators.
* **Administrative Controls:** Centralized governance across all clubs and university branches.

---

## 🛠️ Tech Stack

* **Backend:** Java 21, Spring Boot 3.5.4 (Spring Web, Spring Security, Spring Data JPA, Spring Validation)
* **Frontend / Templating:** Thymeleaf + Spring Security Extras, HTML5/CSS3/JavaScript
* **Database:** PostgreSQL (with Supabase connection pool support)
* **Database Migrations:** Flyway
* **Security:** Role-based Authorization (`STUDENT`, `CLUB_ADMIN`, `UNIVERSITY_ADMIN`)
* **Build Tool:** Maven
* **Deployment & Containerization:** Docker (Multi-stage build, Eclipse Temurin 21 JRE)

---

## ⚙️ Configuration & Environment Variables

The application can be dynamically configured via environment variables or standard properties:

| Variable | Description | Default |
| :--- | :--- | :--- |
| `SPRING_DATASOURCE_URL` | JDBC Connection URL | `jdbc:postgresql://localhost:5432/clubhub4` |
| `SPRING_DATASOURCE_USERNAME` | Database username | `postgres` |
| `SPRING_DATASOURCE_PASSWORD` | Database password | `dsi` |
| `PORT` | HTTP Server port | `8080` |
| `APP_MEDIA_UPLOAD_DIR` | Media/File upload directory | `uploads` |

---

## 📦 Running Locally

### Prerequisites
* **Java 21** or later
* **Maven 3.9+** (or use the included `./mvnw`)
* **PostgreSQL** instance running locally or hosted (e.g. Supabase)

### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Refayatul/clubhub.git
   cd clubhub
   ```

2. **Configure Database Credentials:**
   Set the environment variables or update `src/main/resources/application.properties`.

3. **Build & Run:**
   ```bash
   ./mvnw clean spring-boot:run
   ```

4. **Access the application:**
   Navigate to [http://localhost:8080](http://localhost:8080) in your browser.

---

## 🐳 Docker Deployment

A multi-stage `Dockerfile` is included for containerized environments:

```bash
# Build the Docker image
docker build -t clubhub:latest .

# Run the container
docker run -p 8080:8080 \
  -e SPRING_DATASOURCE_URL="your-db-url" \
  -e SPRING_DATASOURCE_USERNAME="your-db-username" \
  -e SPRING_DATASOURCE_PASSWORD="your-db-password" \
  clubhub:latest
```

---

## 🔍 Health Checks

A lightweight health check endpoint is exposed at:
```http
GET /health
```
Returns `200 OK` (HTTP body `OK`) for uptime monitoring and container liveness probes.
