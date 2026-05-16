# 7-Zip Individual File Mass Compressor

A robust Windows Batch script designed to automate the process of compressing large collections of files (like ROM sets, document archives, or media) into individual `.7z` archives using high-efficiency Ultra settings.

## 🚀 Features

* **Recursive Processing:** Automatically finds and compresses files in all subfolders.
* **Ultra Compression:** Uses LZMA2 at Level 9 (Ultra) for maximum space savings.
* **Dynamic Dictionary Input:** Prompts for dictionary size at runtime (e.g., 64MB, 128MB) and automatically handles unit suffixes.
* **Thread/Core Allocation:** Prompts for CPU thread allocation at runtime, allowing you to scale back core usage to prevent RAM bottlenecks or control system load.
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
4.  **Allocate CPU Cores:** Enter the number of threads/cores you want to use (e.g., `4`), or simply press **Enter** to default to `*` (uses all available CPU power).
5.  **Wait for completion:** The script will show progress for each file.
6.  **Clean up:** Choose `Y` or `N` when asked if you want to delete the original files.

## ⚠️ Important Note on RAM Usage

When using **LZMA2 Ultra** settings, memory usage scales dynamically based on your **Dictionary Size** multiplied by your **Thread Count**. 

As a baseline, a single compression thread requires:
* 64MB Dictionary $\approx$ 650MB RAM
* 128MB Dictionary $\approx$ 1.3GB RAM
* 256MB Dictionary $\approx$ 2.6GB RAM

> 💡 **Pro-Tip for High-Core CPUs:** If you have a 16-core CPU and choose a 128MB dictionary at max threads (`*`), 7-Zip will attempt to use over 20GB of RAM. If your system only has 16GB of RAM, your PC will lag severely. To fix this, restrict the threads (e.g., enter `4` or `8`) when running large dictionaries!

---

## 📜 License

This script is provided "as is" without warranty of any kind. Use it responsibly, especially the cleanup (delete) function.

---

## 🔄 Version History

### **v1.2 (Current)**
* **Feature:** Added manual thread/core allocation control (`-mmt`) to mitigate severe RAM bottlenecks on high-core systems.
* **Improvement:** Implemented a smart fallback that defaults to maximum hardware utilization (`*`) if the user skips the thread prompt.

### **v1.1**
* **Fix:** Resolved a critical bug where files containing special characters (such as `!`) caused the script to misinterpret paths and create malformed archives.
* **Improvement:** Optimized path handling using subroutines for better stability with complex filenames.

### **v1.0**
* Initial release with recursive folder support and dynamic dictionary size input.
