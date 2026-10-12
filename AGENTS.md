# Project Guidelines & Agent Rules

Dokumen ini adalah acuan kerja mutlak untuk setiap asisten AI / developer dalam repositori ini.

---

## 1. Aturan Git & Branching (WAJIB DIPATUHI)

1. **Struktur Branch**:
   - `main`: Branch Production. **DILARANG KERAS push atau merge ke `main`** kecuali diperintahkan secara eksplisit oleh USER.
   - `development`: Branch Integrasi. Menampung kode yang telah selesai dan di-push dari `fase/backend` dan `fase/frontend`.
   - `fase/backend`: Branch pengerjaan khusus backend Laravel.
   - `fase/frontend`: Branch pengerjaan khusus frontend Next.js.

2. **Aturan Kerja Frontend**:
   - Kerjakan codingan frontend di branch `fase/frontend`.
   - Setelah selesai pengerjaan, **langsung commit dan push ke `origin/fase/frontend`**.
   - Segera setelah push ke `fase/frontend`, **merge ke branch `development` dan push ke `origin/development`**.
   - Kembali ke branch pengerjaan (`fase/frontend`).
   - **JANGAN MERGE ATAU PUSH KE `main`**.

3. **Aturan Kerja Backend**:
   - Kerjakan codingan backend di branch `fase/backend`.
   - Setelah selesai pengerjaan, **langsung commit dan push ke `origin/fase/backend`**.
   - Segera setelah push ke `fase/backend`, **merge ke branch `development` dan push ke `origin/development`**.
   - Kembali ke branch pengerjaan (`fase/backend`).
   - **JANGAN MERGE ATAU PUSH KE `main`**.

---

## 2. Arsitektur & Alur Backend Laravel
Merujuk pada petunjuk arsitektur sistem:
- **Pola Arsitektur**:
  - `Routes` -> `Middleware` (Spatie Permission) -> `Form Requests` -> `Controllers` -> `API Resources`
  - `Service Layer` (Domain Logic) -> `Repository Layer` (Data Access) -> `Eloquent Models`
  - `Infrastructure`: PostgreSQL, Redis (Cache & Queue), Queue Workers, File Storage, Scheduler, Notifications
  - `Spatie Packages`: Permission, Media Library, Activitylog
- **5 Fase Pengerjaan Backend**:
  1. **Fase 1 – Database**: Migrations, Models & Relations, Factories, Seeders
  2. **Fase 2 – Core Application**: Repository Layer, Service Layer, Form Requests, Policies & Permissions
  3. **Fase 3 – REST API**: Controllers, API Resources, Routes & Middleware, Authentication
  4. **Fase 4 – Integration**: Spatie Media Library, Spatie Activitylog, Redis & Queue, Events & Notifications
  5. **Fase 5 – Quality & Release**: Tests & API Docs, Deployment & Monitoring -> Production Ready

---

## 3. Arsitektur & Alur Frontend Next.js
Merujuk pada petunjuk arsitektur sistem:
- **Pola Arsitektur**:
  - `User/Browser` -> `Proxy / Route Guard` -> `App Router` (`layout`, `page`, `loading`, `error`, `not-found`)
  - `Rendering & UI`: Server Components, Client Components, Shared Components, Feature Components
  - `Frontend Logic`: Hooks & State, Forms & Validation, Types & Utils
  - `Data Access`: API Client, Auth Service, Feature Services (terhubung via HTTPS/JSON ke Laravel REST API)
  - `Next.js Optimization`: Data Cache, Image Optimization, Streaming & Suspense
- **5 Fase Pengerjaan Frontend**:
  1. **Fase 1 – Foundation**: Create Next.js App, Project Structure, Environment Config, Styles & UI
  2. **Fase 2 – Core Architecture**: Types & Utils, API Client, Auth Service, Proxy & Route Guard
  3. **Fase 3 – UI Development**: Root Layout, Shared Components, Pages & Server Components, Client Components
  4. **Fase 4 – Feature Integration**: Forms & Validation, Feature Services, Hooks & State, Role & Permission UI
  5. **Fase 5 – Quality & Release**: Media Upload, Loading/Error/Cache, Tests & Production Build, Deployment -> Production Ready
