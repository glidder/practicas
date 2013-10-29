cd RPtrain
N = 172;
for i=1:N,
    A = imread(['Coche' num2str(i, '%03d') '.jpg']);
    imagesc(A);
    axis off;
    axis equal;
    title(['Vehículo = ' num2str(i)]);
    pause
end