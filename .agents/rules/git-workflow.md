# Git Workflow & Branching Rules

## Aturan Utama Percabangan (Branching Strategy)
Repositori ini memiliki struktur percabangan yang ketat:

| Branch | Fungsi | Aturan Akses |
|---|---|---|
| `main` | Production Branch | **DILARANG KERAS push atau merge ke `main`** kecuali ada instruksi eksplisit tertulis dari USER. |
| `development` | Integration Branch | Tempat penggabungan utama dari branch `fase/backend` dan `fase/frontend`. |
| `fase/backend` | Backend Development | Khusus pengerjaan seluruh fitur dan kode backend Laravel. |
| `fase/frontend` | Frontend Development | Khusus pengerjaan seluruh fitur dan kode frontend Next.js. |

---

## 1. Aturan Pengerjaan Frontend
Setiap kali AI / developer mengerjakan kode yang berkaitan dengan **frontend** (direktori `frontend/`):
1. **Bekerja pada branch `fase/frontend`**:
   ```bash
   git checkout fase/frontend
   ```
2. **Selesaikan coding dan lakukan commit**:
   ```bash
   git add frontend/
   git commit -m "feat(frontend): <deskripsi-perubahan>"
   ```
3. **Langsung push ke `fase/frontend`**:
   ```bash
   git push origin fase/frontend
   ```
4. **Segera merge ke `development` dan push ke origin**:
   ```bash
   git checkout development
   git merge fase/frontend
   git push origin development
   git checkout fase/frontend # kembali ke branch pengerjaan
   ```
5. **JANGAN PERNAH** melakukan merge atau push ke `main`.

---

## 2. Aturan Pengerjaan Backend
Setiap kali AI / developer mengerjakan kode yang berkaitan dengan **backend** (direktori `backend/`):
1. **Bekerja pada branch `fase/backend`**:
   ```bash
   git checkout fase/backend
   ```
2. **Selesaikan coding dan lakukan commit**:
   ```bash
   git add backend/
   git commit -m "feat(backend): <deskripsi-perubahan>"
   ```
3. **Langsung push ke `fase/backend`**:
   ```bash
   git push origin fase/backend
   ```
4. **Segera merge ke `development` dan push ke origin**:
   ```bash
   git checkout development
   git merge fase/backend
   git push origin development
   git checkout fase/backend # kembali ke branch pengerjaan
   ```
5. **JANGAN PERNAH** melakukan merge atau push ke `main`.

---

## 3. Larangan Khusus Branch `main`
- Jangan pernah menjalankan `git push origin main` atau `git merge ...` ke branch `main`.
- Branch `main` hanya boleh diperbarui jika USER secara eksplisit memberikan perintah seperti: *"sekarang push ke main"* atau *"merge development ke main"*.
