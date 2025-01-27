;; Programa SelectBlocksInLayouts
;; Copyright (C) 2025 Ing. Franklin Rodriguez
;; https://www.linkedin.com/in/franklinrodriguezacosta/
;;
;; Este programa es software libre: puede redistribuirlo y/o modificarlo
;; bajo los términos de la Licencia Pública General GNU publicada por
;; la Free Software Foundation, ya sea la versión 3 de la Licencia, o
;; (a su elección) cualquier versión posterior.
;;
;; Este programa se distribuye con la esperanza de que sea útil,
;; pero SIN NINGUNA GARANTÍA; sin siquiera la garantía implícita de
;; COMERCIABILIDAD o APTITUD PARA UN PROPÓSITO PARTICULAR. Consulte la
;; Licencia Pública General GNU para más detalles.
;;
;; Debería haber recibido una copia de la Licencia Pública General GNU
;; junto con este programa. Si no es así, consulte <https://www.gnu.org/licenses/>.
;;
;; Desarrollado con la ayuda de claude.ai
;; 
;; Descripción:
;; Este programa permite seleccionar todos los bloques del mismo nombre en diferentes
;; layouts. Es útil, por ejemplo, para seleccionar bloques de rótulo y exportar su
;; información con ATTOUT. La exportación incluye varias filas del bloque en un mismo
;; archivo. Para actualizaciones posteriores del bloque, 
;; mantener la columna Handle y usar ATTIN.

(princ "\nComando disponible: SelectBlocksInLayouts")
(princ "\nUso: Escriba SelectBlocksInLayouts en la línea de comandos")
(princ)

(defun c:SelectBlocksInLayouts ()
  
  ;; Para imprimir mensajes en la línea de comandos se usa princ
  (princ "\nSeleccione un bloque o presione Enter si ya hay uno seleccionado...")
  
  (setq ss (ssget "_:S" '((0 . "INSERT"))))
  (if (= ss nil)
    (setq ss (ssget '((0 . "INSERT"))))
  )
  
  (if (= ss nil)
    (progn
      (alert "No se seleccionó ningún bloque.")
      (exit)
    )
  )
  
  (setq ent (ssname ss 0))
  (setq blockName (cdr (assoc 2 (entget ent))))
  
  ;; Mensaje informativo durante la ejecución
  (princ (strcat "\nBuscando bloques con nombre: " blockName "..."))
  
  (setq layouts (layoutlist))
  (setq allBlocks (ssadd))
  (setq currentLayout (getvar "ctab"))
  (setq cmdecho (getvar "cmdecho"))
  (setvar "cmdecho" 0)
  
  (foreach layout layouts
    (command "._LAYOUTRESTORE" "S" layout)
    (setq layoutBlocks (ssget "X" (list (cons 0 "INSERT") (cons 2 blockName))))
    (if layoutBlocks
      (repeat (sslength layoutBlocks)
        (setq block (ssname layoutBlocks 0))
        (ssadd block allBlocks)
        (ssdel block layoutBlocks)
      )
    )
  )
  
  (command "._LAYOUTRESTORE" "S" currentLayout)
  (setvar "cmdecho" cmdecho)
  
  (if (> (sslength allBlocks) 0)
    (sssetfirst nil allBlocks)
  )
  
  (alert (strcat "Se encontraron " (itoa (sslength allBlocks)) " bloques con el nombre \"" blockName "\""))
  
  ;; Mensaje final en la línea de comandos
  (princ (strcat "\nProceso completado. Se encontraron " 
                 (itoa (sslength allBlocks)) 
                 " bloques."))
  (princ)
)

;; Este princ final es necesario para cargar el archivo silenciosamente
(princ)