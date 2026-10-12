# Arsitektur & Alur Pengerjaan Backend Laravel

Panduan arsitektur dan alur pembuatan backend Laravel berdasarkan standar rancangan sistem.

---

## 1. Arsitektur Backend Laravel

```
[FRONTEND]
    │
    ▼
[HTTP / PRESENTATION LAYER]
 ├── Routes
 ├── Middleware  <──────┐ (Spatie Permission)
 ├── Form Requests      │
 ├── Controllers        │
 └── API Resources      │
    │                   │
    ▼                   │
[SERVICE & DOMAIN LAYER]│
 ├── Service Layer      │
 ├── Events             │
 ├── Jobs               │
 └── Policies    <──────┴── [SPATIE PACKAGES]
    │                        ├── Permission (Role & Permissions)
    ▼                        ├── Media Library (File Uploads)
[DATA ACCESS LAYER]          └── Activitylog (Audit Trail)
 ├── Repository Layer
 └── Eloquent Models <──────────┘
    │
    ▼
[INFRASTRUCTURE LAYER]
 ├── Database: PostgreSQL
 ├── Cache & Broker: Redis
 ├── Queue Worker
 ├── File Storage (Media Library)
 ├── Scheduler
 └── Notifications
```

### Layer Responsibilities:
1. **Controllers & API Resources**: Tipis (lean), hanya menerima request, memanggil service layer, dan mengembalikan format respon melalui API Resources.
2. **Form Requests**: Menangani validasi input secara terpisah dari controller.
3. **Service Layer**: Mengenkapsulasi seluruh logika bisnis aplikasi.
4. **Repository Layer**: Mengabstraksi query dan manipulasi data dari Eloquent Models.
5. **Eloquent Models**: Relasi database, casts, scopes, dan hooks untuk Spatie Activitylog & Media Library.
6. **Spatie Ecosystem**:
   - `spatie/laravel-permission`: Otorisasi hak akses peran & izin pada route/middleware/policy.
   - `spatie/laravel-medialibrary`: Manajemen aset media dan file attachment.
   - `spatie/laravel-activitylog`: Pencatatan log aktivitas dan riwayat perubahan data.

---

## 2. Alur Pembuatan Backend Laravel (5 Fase)

Setiap pengembangan backend wajib mengikuti tahapan fase berikut secara berurutan:

### **FASE 1 – DATABASE**
1. **Migrations**: Desain skema tabel database (PostgreSQL-ready).
2. **Models & Relations**: Model Eloquent lengkap dengan relasi (hasMany, belongsTo, dsb).
3. **Factories**: Pembuatan factory untuk kemudahan pembuatan dummy data pengujian.
4. **Seeders**: Seeder data master, data awal sistem, dan akun administrator.

### **FASE 2 – CORE APPLICATION**
5. **Repository Layer**: Abstraksi layer repositori data.
6. **Service Layer**: Implementasi logika bisnis terpusat.
7. **Form Requests**: Validasi request rules dan otorisasi form.
8. **Policies & Permissions**: Aturan izin otorisasi menggunakan Spatie Permission.

### **FASE 3 – REST API**
9. **Controllers**: Controller endpoint API RESTful.
10. **API Resources**: Serialisasi dan standarisasi response payload JSON.
11. **Routes & Middleware**: Pemetaan endpoint di `routes/api.php` dan penerapan middleware proteksi.
12. **Authentication**: Autentikasi API (misalnya Laravel Sanctum).

### **FASE 4 – INTEGRATION**
13. **Spatie Media Library**: Setup koleksi media, thumbnail conversion, dan disk storage.
14. **Spatie Activitylog**: Pencatatan log aktivitas pengguna dan perubahan model.
15. **Redis & Queue**: Konfigurasi Redis caching dan asynchronous queue worker.
16. **Events & Notifications**: Event listener, broadcast, dan channel notifikasi.

### **FASE 5 – QUALITY & RELEASE**
17. **Tests & API Docs**: Unit/Feature tests (Pest / PHPUnit) serta dokumentasi endpoint API.
18. **Deployment & Monitoring**: Health checks, environment production config -> **PRODUCTION READY**.
