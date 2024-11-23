function [] = SaveErrorPlotToPDF(filename,f,n1,n2,step)
  PlotError(f,n1,n2,step);
  path = "images/" + filename + ".pdf";
  exportgraphics(gcf,path,'ContentType','vector');
end