MAIN
    DEFINE rec RECORD
               richtext STRING,
               info STRING
           END RECORD
    #DEFINE last_saved STRING

    OPTIONS INPUT WRAP, FIELD ORDER FORM

    OPEN FORM f1 FROM "wc_fglrichtext"
    DISPLAY FORM f1

    INPUT BY NAME rec.*
          ATTRIBUTES(UNBUFFERED, WITHOUT DEFAULTS)
        ON ACTION get_cont ATTRIBUTES(TEXT="Get content")
           LET rec.info = rec.richtext
        ON ACTION set_cont ATTRIBUTES(TEXT="Set content")
           --LET rec.richtext = SFMT( "<html><body>%1</body></html>",
           --                         "<p>This is new text " || current || "</p>" )

           LET rec.richtext =  "<h1 style=\"text-align:center;\"><span style=\"color: rgb(84,172,210);font-size: 30px;\"><strong><ins>This is a Title</ins></strong></span></h1>
                                <p></p>
                                <p>This is a list</p>
                                <ul>
                                <li>Item 1</li>
                                <li>Item 2</li>
                                <ul>
                                <li>SubItem1</li>
                                </ul>
                                </ul>
                                <ol>
                                <li>One</li>
                                <li>Two</li>
                                <li>Three</li>
                                </ol>
                                <h3><span style=\"font-family: Tahoma;\">Tahoma Header 3</span></h3>
                                <p style=\"text-align:right;\"><span style=\"font-family: Tahoma;\">Align Right</span></p>
                                <p></p>
                                <p style=\"text-align:left;\"><em>\"A pesimist sees the difficulty in every opportunity; an optimistt sees the opportunity in every difficulty. Winston Churchill\"</em></p>"
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
