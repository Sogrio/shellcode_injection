section .text
    global _start

_start:
    ; Ouverture du fichier ELF cible avec vérification d'erreur
    mov eax, 5          ; syscall: open
    mov ebx, target_file
    xor ecx, ecx        ; O_RDONLY
    xor edx, edx        ; mode (non utilisé)
    int 0x80            ; syscall interrupt
    
    ; Vérification si l'ouverture a réussi
    test eax, eax
    js error_exit       ; saute si erreur (valeur négative)
    
    mov esi, eax        ; sauvegarde du descripteur de fichier

    ; Lecture de l'en-tête ELF avec gestion d'erreur
    mov eax, 3          ; syscall: read
    mov ebx, esi        ; descripteur
    mov ecx, buffer     ; tampon pour ELF header
    mov edx, 64         ; lire 64 octets
    int 0x80
    
    ; Vérification si la lecture a réussi
    test eax, eax
    js error_exit       ; saute si erreur (valeur négative)

    ; Vérifier la signature ELF (Magic numbers)
    mov eax, [buffer]
    cmp eax, 0x464C457F ; Comparaison avec "\x7FELF"
    jne invalid_elf

    ; Fermeture du fichier
    mov eax, 6          ; syscall: close
    mov ebx, esi        ; descripteur de fichier
    int 0x80

    ; Sortie propre
    xor ebx, ebx        ; code de sortie 0
    mov eax, 1          ; syscall: exit
    int 0x80

error_exit:
    ; Gestion des erreurs
    mov ebx, 1          ; code de sortie 1 (erreur)
    mov eax, 1          ; syscall: exit
    int 0x80

invalid_elf:
    ; Gestion des fichiers ELF invalides
    mov ebx, 2          ; code de sortie 2 (ELF invalide)
    mov eax, 1          ; syscall: exit
    int 0x80

section .data
    target_file db 'vulnerable_elf', 0

section .bss
    buffer resb 64      ; buffer pour l'en-tête ELF
