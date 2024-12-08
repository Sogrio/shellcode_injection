# ELF File Analyzer en Assembleur x86

## 📜 Description

Un programme bas niveau en assembleur x86 pour l'analyse et la vérification de fichiers ELF (Executable and Linkable Format) sous Linux. 
Ce projet démontre les techniques de manipulation de fichiers binaires au niveau système, avec une attention particulière sur la validation et l'inspection des en-têtes ELF.

## 🎯 Fonctionnalités

- Ouverture et lecture de fichiers ELF
- Validation de la signature ELF 
- Gestion des erreurs
- Analyse de base des en-têtes de fichiers exécutables

## 🛠 Prérequis

- Assembleur NASM
- Système Linux x86
- Makefile (optionnel mais recommandé)

## 💾 Installation

### Compilation

```bash
nasm -f elf32 1nj3ct.asm
ld -m elf_i386 -o 1nj3ct 1nj3ct.o
