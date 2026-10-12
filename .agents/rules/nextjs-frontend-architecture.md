# Arsitektur & Alur Pengerjaan Frontend Next.js

Panduan arsitektur dan alur pembuatan frontend Next.js App Router yang terintegrasi dengan Laravel REST API.

---

## 1. Arsitektur Frontend Next.js

```
[USER / BROWSER]
       │
       ▼
    [Proxy / Route Guard]
       │
       ▼
 [APP ROUTER]
  ├── Layouts
  ├── Pages
  ├── Loading UI
  ├── Error Handling
  └── Not Found
       │
       ▼
 [RENDERING & UI] ──────────────────────┐
  ├── Server Components (SSR/Streaming)  │
  ├── Client Components (Interactivity)  │
  ├── Shared Components (UI Kit/Commons) │
  └── Feature Components (Modul Spesifik)│
       │                                 │
       ▼                                 │
 [FRONTEND LOGIC]                        │
  ├── Hooks & State                      │
  ├── Forms & Validation (Zod, dsb)      │
  └── Types & Utils (TypeScript)         │
       │                                 │
       ▼                                 │
 [DATA ACCESS]                           │
  ├── API Client (Fetch/Axios Wrapper)   │
  ├── Auth Service (Token & Session)     │
  └── Feature Services (CRUD Endpoints)  │
       │                                 │
       ▼ (HTTPS / JSON)                  ▼ (Image/Static Assets)
 [LARAVEL REST API]             [BACKEND STORAGE / ASSETS]
  (PostgreSQL, Redis, Storage)
```

### Next.js Optimization & Support:
- **Optimization**: Data Cache, Image Optimization (`next/image`), Streaming & Suspense.
- **Support**: Environment Config (`.env.local`), Public Assets, Styling (CSS), Testing.

---

## 2. Alur Pembuatan Frontend Next.js (5 Fase)

Setiap pengembangan frontend wajib mengikuti tahapan fase berikut secara berurutan:

### **FASE 1 – FOUNDATION**
1. **Create Next.js App**: Inisialisasi basis aplikasi Next.js (App Router, TypeScript).
2. **Project Structure**: Tata letak direktori rapi (`app/`, `components/`, `lib/`, `services/`, `types/`, `hooks/`).
3. **Environment Config**: Setup variabel lingkungan API URL, auth secret, dsb.
4. **Styles & UI**: Sistem desain CSS, tema warna, font, dan elemen dasar UI.

### **FASE 2 – CORE ARCHITECTURE**
5. **Types & Utils**: Definisi interface TypeScript dan helper utility functions.
6. **API Client**: HTTP client terpusat dengan interceptor headers, handling token & errors.
7. **Auth Service**: Autentikasi terintegrasi dengan endpoint auth Laravel (Login, Register, Logout, Token storage).
8. **Proxy & Route Guard**: Proteksi halaman privat dan redirect berbasis status otentikasi.

### **FASE 3 – UI DEVELOPMENT**
9. **Root Layout**: Shell aplikasi, header, sidebar, footer, dan dynamic metadata.
10. **Shared Components**: Komponen reusable (Button, Input, Modal, Table, Card, Toast).
11. **Pages & Server Components**: Halaman utama dengan rendering server-side jika memungkinkan.
12. **Client Components**: Komponen interaktif dengan state dan event handler.

### **FASE 4 – FEATURE INTEGRATION**
13. **Forms & Validation**: Form input dengan validasi schema client-side dan penanganan error dari Laravel Form Requests.
14. **Feature Services**: Integrasi endpoint fitur bisnis dengan Laravel REST API.
15. **Hooks & State**: Custom hooks untuk fetching data, mutasi, dan state management.
16. **Role & Permission UI**: Tampilan antarmuka yang menyesuaikan izin pengguna dari Spatie Permission backend.

### **FASE 5 – QUALITY & RELEASE**
17. **Media Upload**: Komponen upload file/gambar yang terhubung ke backend storage/Spatie Media Library.
18. **Loading, Error & Cache**: Indikator loading, error boundary fallback, dan strategi revalidasi cache.
19. **Tests & Production Build**: Validasi build production (`next build`) tanpa error lint maupun TypeScript.
20. **Deployment & Monitoring**: Setup rilis ke server production -> **PRODUCTION READY**.
