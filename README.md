# 7-Zip Individual File Mass Compressor

A robust Windows Batch script designed to automate the process of compressing large collections of files (like ROM sets, document archives, or media) into individual `.7z` archives using high-efficiency Ultra settings.

## 🚀 Features

* **Recursive Processing:** Automatically finds and compresses files in all subfolders.
* **Ultra Compression:** Uses LZMA2 at Level 9 (Ultra) for maximum space savings.
* **Dynamic Dictionary Input:** Prompts for dictionary size at runtime (e.g., 64MB, 128MB) and automatically handles unit suffixes.
* **Intelligent Pathing:** Archives are created in the same folder as the source file, maintaining your directory structure perfectly.
* **Collision Prevention:** Automatically ignores `.bat` and existing `.7z` files to prevent infinite loops.
* **Optional Cleanup:** One-time prompt at the end to safely delete original files only after successful compression.

## 🛠️ Requirements

1.  **Windows OS**
2.  **7-Zip Installed:** Default path is expected at `C:\Program Files\7-Zip\7z.exe`. If yours is different, edit the `set "zipExe=..."` line in the script.

## 📖 How to Use

1.  **Place the script:** Move the `.bat` file into the root folder containing the files you want to compress.
2.  **Run it:** Double-click the script. (No need to run as Admin unless files are in a protected system directory).
3.  **Choose Dictionary Size:** When prompted, enter a number (e.g., `128`).
    * *Tip:* Larger dictionaries improve compression but require more RAM.
4.  **Wait for completion:** The script will show progress for each file.
5.  **Clean up:** Choose `Y` or `N` when asked if you want to delete the original files.

## ⚠️ Important Note on RAM Usage

When using **LZMA2 Ultra** settings:
- 64MB Dictionary requires ~650MB RAM for compression.
- 128MB Dictionary requires ~1.3GB RAM.
- 256MB Dictionary requires ~2.6GB RAM.
Ensure your system has enough free memory for the size you choose!

## 📜 License

This script is provided "as is" without warranty of any kind. Use it responsibly, especially the cleanup (delete) function.
---

## 🔄 Version History

### **v1.1 (Current)**
* **Fix:** Resolved a critical bug where files containing special characters (such as `!`) caused the script to misinterpret paths and create malformed archives.
* **Improvement:** Optimized path handling using subroutines for better stability with complex filenames.

### **v1.0**
* Initial release with recursive folder support and dynamic dictionary size input.
