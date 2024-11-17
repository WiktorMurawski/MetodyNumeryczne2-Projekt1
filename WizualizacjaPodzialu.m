function [] = WizualizacjaPodzialu(n)

figure(1);
clf;
hold on;
grid on;
xlim([-1,1]);
ylim([-1,1]);
fill([1,0,-1,0],[0,1,0,-1],'r','FaceAlpha',0.2);


for x = 0:n-1
  for y = 0:n-x-1
    triangle = [
      x/n, y/n;
      (x+1)/n, y/n;
      x/n, (y+1)/n;
      ];

    triangles = {
      triangle; % I ćwiartka
      [-triangle(:,1), triangle(:,2)]; % II ćwiartka
      [-triangle(:,1), -triangle(:,2)]; % III ćwiartka
      [triangle(:,1), -triangle(:,2)]; % IV ćwiartka
      };

    for k = 1:length(triangles)
      t = triangles{k};
      X = [t(1,1),t(2,1),t(3,1)];
      Y = [t(1,2),t(2,2),t(3,2)];
      fill(X,Y,'c','FaceAlpha',0.3);
      input('','s');
    end
  end % for y

  for y = 0:n-x-2
    triangle = [
      (x+1)/n, (y+1)/n;
      (x+1)/n, y/n;
      x/n, (y+1)/n;
      ];

    triangles = {
      triangle; % I ćwiartka
      [-triangle(:,1), triangle(:,2)]; % II ćwiartka
      [-triangle(:,1), -triangle(:,2)]; % III ćwiartka
      [triangle(:,1), -triangle(:,2)]; % IV ćwiartka
      };

    for k = 1:length(triangles)
      t = triangles{k};
      X = [t(1,1),t(2,1),t(3,1)];
      Y = [t(1,2),t(2,2),t(3,2)];
      fill(X,Y,'c','FaceAlpha',0.3);
      input('','s');
    end
  end % for y

end % for x

end % function