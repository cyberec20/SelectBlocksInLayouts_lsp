# SelectBlocksInLayouts.lsp

**Author:** Ing. Franklin Rodriguez  
**License:** GNU General Public License v3.0  
**LinkedIn:** [https://www.linkedin.com/in/franklinrodriguezacosta/](https://www.linkedin.com/in/franklinrodriguezacosta/)

## 📌 Description

`SelectBlocksInLayouts.lsp` is an AutoLISP utility for AutoCAD that allows you to **select all instances of a specific block name across multiple layouts** in a drawing. It is particularly useful when working with **title blocks** or **repeating elements** and aiming to extract their attributes efficiently using `ATTOUT`.

After exporting the block attributes, you can later reimport updated values using `ATTIN`, as long as you **preserve the `Handle` column** in your CSV file.

---

## ✅ Features

- Selects all block references (`INSERT` entities) with a given name across all layouts.
- Supports automated selection, even when block is already preselected.
- Preserves user’s current layout and settings.
- Enables quick post-processing (e.g., ATTOUT/ATTIN workflows).
- Useful for batch editing or mass attribute operations.

---

## 🔧 How to Use

1. **Load the LISP file** in AutoCAD:
   - Use the `APPLOAD` command and browse for `SelectBlocksInLayouts.lsp`.

2. **Run the command**:
   - In the command line, type:  
     ```
     SelectBlocksInLayouts
     ```
3. **When prompted**:
   - Select any instance of the block you want to find across layouts.
   - If one is already selected, just press `Enter`.

4. The program will:
   - Search all layouts for blocks with the same name.
   - Restore your original layout.
   - Select all matching blocks for further processing (e.g., `ATTOUT`).

---

## 📦 Example Use Case

You are managing a project with dozens of layouts, each containing a title block. You want to export all title block attributes to a spreadsheet, edit them in bulk, and later re-import the changes. This script helps you **collect all the blocks in one go**, ensuring accurate `Handle` reference for reliable `ATTIN`.

---

## ⚠️ Notes

- The script uses `LAYOUTRESTORE` to switch between layouts. Make sure layout states are saved.
- Designed for AutoCAD environments supporting AutoLISP and dynamic layouts.

---

## 🧾 License

This program is free software: you can redistribute it and/or modify  
it under the terms of the GNU General Public License as published by  
the Free Software Foundation, either version 3 of the License, or  
(at your option) any later version.

See [https://www.gnu.org/licenses/](https://www.gnu.org/licenses/) for details.

---

## 🤝 Acknowledgements

- Developed by **Ing. Franklin Rodriguez**  
  [LinkedIn: linkedin.com/in/franklinrodriguezacosta](https://www.linkedin.com/in/franklinrodriguezacosta/)
- Developed with the help of Claude.ai.
- Inspired by practical CAD workflows in multidisciplinary engineering projects.
