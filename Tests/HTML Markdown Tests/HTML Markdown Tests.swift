//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/08/2024.
//

import Foundation
import Testing
import HTML_Markdown

@Test
func markdown(){
    
    
   print(
    createMarkdown {
        if true {
            "## de_volgende_artikelen_van_deze_titel_behalve_artikel_5_gelden_niet_voor_de_rechtspersoon"
        }
        if true {
            "### met_uitzondering_van_artikel_5_gelden_de_volgende_artikelen_van_deze_titel_niet_voor_de_rechtspersoon"
        }
        if true {
            "# overeenkomstige_toepassing_van_de_volgende_artikelen_van_deze_titel_is_geoorloofd"
        }
    }
   )
    
}





func createMarkdown(@MarkdownBuilder _ content: () -> String) -> String {
    content()
}
