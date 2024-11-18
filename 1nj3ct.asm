section .data
    msg db 'Injection réussie!', 0  ; Message à afficher
    msg_len equ $ - msg             ; Longueur du message

section .text
global _start

_start:
    ; Obtenir un handle de processus
    mov eax, 0x24        ; Code pour l'appel système NtOpenProcess (exemple simplifié)
    ; Paramètres de l'appel (pseudo-code pour illustration)
    ; push handle
    ; push access_flags
    ; push process_id
    ; int 0x80 (sous Linux/Windows, des variations existent)

    ; Allocation de la mémoire dans le processus cible
    mov eax, 0x25        ; NtAllocateVirtualMemory (similaire)
    ; Paramètres : emplacement mémoire, taille, etc.

    ; Écriture du code dans la mémoire allouée
    ; mov eax, 0x26      ; NtWriteVirtualMemory
    ; Paramètres : handle du processus, adresse de destination, buffer source, taille

    ; Création d'un thread distant pour exécuter le code
    mov eax, 0x27        ; NtCreateThreadEx (ou équivalent)
    ; Paramètres : handle, point d'entrée du thread, etc.

    ; Fin du programme propre (pour le POC)
    mov eax, 1           ; Exit syscall (Linux : syscall 1, Windows : ExitProcess)
    xor ebx, ebx
    int 0x80

