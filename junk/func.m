function integral = double_integral_with_visualization(f, n)
    % f - funkcja do zintegrowania, np. @(x,y) x^2 + y^2
    % n - liczba podziałów wzdłuż każdego boku

    % % Ustawienia wykresu
    % figure(1);clf;
    % grid on
    % xticks(-1:0.1:1);
    % yticks(-1:0.1:1);
    % hold on;
    % axis equal;
    % axis([-1, 1, -1, 1]);
    % xlabel('x');
    % ylabel('y');
    % title(['Podział obszaru na trójkąty dla n = ', num2str(n)]);
    % %fill([-1, 1, 1, -1], [0, -1, 1, 0], 'cyan', 'FaceAlpha', 0.1, 'EdgeColor', 'none');  % Romb
    % fill([0, 1, 0, -1], [1, 0, -1, 0], 'red', 'FaceAlpha', 0.1, 'EdgeColor', 'none');  % Romb
    

    % Współczynniki i punkty dla kwadratury drugiego rzędu na trójkącie jednostkowym
    w = [1/3, 1/3, 1/3];    % Wagi
    xi = [1/2, 1/2, 0];     % Punkty xi
    eta = [1/2, 0, 1/2];    % Punkty eta

    % Inicjalizacja wartości całki
    integral = 0;

    % Podział obszaru na n^2 trójkątów w każdej ćwiartce
    for i = 0:n-1
        for j = 0:n-1
            % Współrzędne wierzchołków małych trójkątów w ćwiartce pierwszej
            vertices1 = [
                i / n, j / n;
                (i + 1) / n, j / n;
                i / n, (j + 1) / n;
            ];
            vertices2 = [
                (i + 1) / n, j / n;
                (i + 1) / n, (j + 1) / n;
                i / n, (j + 1) / n;
            ];

            % Przełóż te trójkąty na 4 ćwiartki rombu poprzez symetrię
            triangles = {
                vertices1;                     % I ćwiartka, trójkąt 1
                vertices2;                     % I ćwiartka, trójkąt 2
                [-vertices1(:,1), vertices1(:,2)];   % II ćwiartka, trójkąt 1
                [-vertices2(:,1), vertices2(:,2)];   % II ćwiartka, trójkąt 2
                [vertices1(:,1), -vertices1(:,2)];   % III ćwiartka, trójkąt 1
                [vertices2(:,1), -vertices2(:,2)];   % III ćwiartka, trójkąt 2
                [-vertices1(:,1), -vertices1(:,2)];  % IV ćwiartka, trójkąt 1
                [-vertices2(:,1), -vertices2(:,2)];  % IV ćwiartka, trójkąt 2
            };

            % Przetwarzaj i rysuj trójkąty w każdej ćwiartce, jeśli są w obszarze D
            for k = 1:length(triangles)
                tri = triangles{k};
                % Sprawdzenie, czy wierzchołki trójkąta są w obrębie rombu
                if all(sum(abs(tri), 2) <= 1)
                    % Całkuj po trójkącie
                    integral = integral + IntegralOnTriangle(f, tri(1,1), tri(1,2), tri(2,1), tri(2,2), tri(3,1), tri(3,2));
                    % % Rysuj trójkąt
                    % plot_triangle(tri(1,:), tri(2,:), tri(3,:));
                end
            end
        end
    end

    hold off;
end

% function plot_triangle(A, B, C)
%     % Funkcja do rysowania trójkąta o wierzchołkach A, B, C
%     fill([A(1), B(1), C(1)], [A(2), B(2), C(2)], 'r', 'FaceAlpha', 0, 'EdgeColor', 'k');
% end


%f = @(x, y) x.^2 + y.^2;  % Przykładowa funkcja do całkowania
f = @(x, y) x + y;
n = 2;  % Liczba podziałów
figure(1);clf;
result = double_integral_with_visualization(f, n);
disp(['Wynik całkowania: ', num2str(result)]);