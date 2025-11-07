#let hBar() = [#h(5pt) | #h(5pt)]

#let latinFontList = (
  "Source Sans 3",
  "Linux Libertine",
  // "Source Sans Pro",
  "Font Awesome 6 Brands",
  "Font Awesome 6 Free",
)
#let latinHeaderFont = ("TheAntiquaSunOT")

#let latinSectionFont = ("TheSerifOffice-Plain")
#let latinSubSectionFont = ("TheMixOffice-Plain")
#let latinBodyFont = ("TheSansOffice")

#let awesomeColors = (
  skyblue: rgb("#0395DE"),
  red: rgb("#DC3522"),
  nephritis: rgb("#27AE60"),
  concrete: rgb("#95A5A6"),
  darknight: rgb("#131A28"),
)

#let regularColors = (
  subtlegray: rgb("#ededee"),
  lightgray: rgb("#343a40"),
  darkgray: rgb("#212529"),
)

/// Set the accent color for the document
#let setAccentColor(awesomeColors, metadata) = {
  let param = metadata.layout.awesome_color
  return if param in awesomeColors {
    awesomeColors.at(param)
  } else {
    rgb(param)
  }
}

/// Overwrite the default fonts if the metadata has custom font values
/// 
/// - metadata (array): the metadata object
/// - latinFontList (array): the default list of latin fonts
/// - latinHeaderFont (string): the default header font
/// -> array
#let overwriteFonts(metadata, latinFontList, latinHeaderFont, latinSectionFont, latinSubSectionFont, latinBodyFont) = {
  let metadataFonts = metadata.layout.at("fonts", default: [])
  let regularFonts = latinFontList
  let headerFont = latinHeaderFont
  let sectionFont = latinSectionFont
  let subSectionFont = latinSubSectionFont
  let bodyFont = latinBodyFont
  
  if metadataFonts.len() > 0 {
    regularFonts = metadataFonts.at("regular_fonts", default: latinFontList)
    headerFont = metadataFonts.at("header_font", default: latinHeaderFont)
    sectionFont = metadataFonts.at("section_font", default: latinSectionFont)
    subSectionFont = metadataFonts.at("subsection_font", default: latinSubSectionFont)
    bodyFont = metadataFonts.at("body_font", default: latinBodyFont)
  }
  
  return (
    regularFonts: regularFonts, 
    headerFont: headerFont,
    sectionFont: sectionFont,
    subSectionFont: subSectionFont,
    bodyFont: bodyFont
  )
}