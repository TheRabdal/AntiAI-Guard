# AntiAI-Guard

AntiAI-Guard adalah sistem proteksi berlapis untuk mencegah kode proyek dibaca, dimodifikasi, atau ditulis oleh asisten dan agen kecerdasan buatan (AI).

---

## Lapisan Proteksi

### 1. Proteksi IDE VS Code (`.vscode/settings.json`)
* `chat.disableAIFeatures`: Menonaktifkan seluruh fitur chat dan AI bawaan.
* `editor.inlineSuggest.enabled`: Menonaktifkan rekomendasi baris kode otomatis.
* `github.copilot.enable`: Menonaktifkan ekstensi GitHub Copilot.

### 2. Aturan Agen AI (`AGENTS.md` & `.cursorrules`)
* Menyatakan larangan keras bagi AI coding agent (Antigravity, Cursor, Claude Code, Devin, Copilot Workspace) untuk menulis, mengubah, atau membuat file baru di repositori ini.

### 3. Kunci File OS (PowerShell Script)
Mencegah modifikasi fisik pada level sistem operasi (Read-Only):
* **Mengunci file:**
  ```powershell
  .\Protect-Project.ps1
  ```
  *(Semua file menjadi Read-Only sehingga editor/AI lokal gagal melakukan write).*
* **Membuka kunci (untuk developer manusia):**
  ```powershell
  .\Unprotect-Project.ps1
  ```

### 4. Lingkungan Terisolasi (Windows Sandbox)
* **`AntiAI-Guard.wsb`**: Menjalankan Windows Sandbox dengan proteksi clipboard, mikrofon, kamera, dan GPU.
* **`AntiAI-Guard-Airgap.wsb`**: Mode Air-Gap penuh (koneksi internet dimatikan total) untuk isolasi kode tanpa risiko kebocoran ke API cloud AI.
