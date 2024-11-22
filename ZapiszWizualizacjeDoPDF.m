function [] = ZapiszWizualizacjeDoPDF(n)
  WizualizacjaPodzialu(n)
  path = "images/"+"figure"+int2str(n)+".pdf";
  exportgraphics(gcf,path,'ContentType','vector')
end