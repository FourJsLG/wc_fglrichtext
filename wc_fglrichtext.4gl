MAIN
    DEFINE rec RECORD
               richtext STRING,
               info STRING
           END RECORD

    OPTIONS INPUT WRAP, FIELD ORDER FORM

    OPEN FORM f1 FROM "wc_fglrichtext"
    DISPLAY FORM f1

    INPUT BY NAME rec.*
          ATTRIBUTES(UNBUFFERED, WITHOUT DEFAULTS)
        ON ACTION get_cont ATTRIBUTES(TEXT="Get content")
           LET rec.info = rec.richtext
        ON ACTION set_cont ATTRIBUTES(TEXT="Set content")
           LET rec.richtext = SFMT( "<html><body>%1</body></html>",
                                    "<p>This is new text " || current || "</p>" )
           LET rec.info = "Text reloaded."
        ON ACTION clear ATTRIBUTES(TEXT="Clear")
           LET rec.richtext = NULL
           LET rec.info = "Text cleared."
        ON ACTION set_focus_to_wc ATTRIBUTES(TEXT="Focus to RichText")
           NEXT FIELD richtext
        ON ACTION set_focus_to_info ATTRIBUTES(TEXT="Focus to info")
           NEXT FIELD info
    END INPUT

END MAIN