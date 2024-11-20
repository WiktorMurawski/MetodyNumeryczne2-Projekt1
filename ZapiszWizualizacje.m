function [] = ZapiszWizualizacje(n)
  WizualizacjaPodzialu(n)
  exportgraphics(gcf, "figure"+int2str(n)+".pdf", 'ContentType', 'vector')
end