
removeHTMLTags(String string) {
  return string.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
}
