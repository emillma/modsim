function x = ERKTemplate(ButcherArray, f, T, dt, x0)%assuming explicit Runge Kutta
    A = ButcherArray.A;
    c = ButcherArray.c;
    b = ButcherArray.b;

    Nstage = size(c, 1);
    Nt = size(T, 2);
    Nx = size(x0, 1);

    K = zeros(Nx, Nstage);
    x = zeros(Nx, Nt);

    x(:, 1) = x0;

    for nt = 2:Nt
        x_k = x(:, nt - 1);
        K(:, 1) = f(T(nt), x_k);

        for nstage = 2:Nstage
            ksum = 0;

            for i = 1:nstage - 1
                ksum = ksum + A(nstage, i) * K(:, i);
            end

            K(:, nstage) = f(T(nt), x_k + dt * ksum);
        end

        xsum = 0;

        for m = 1:Nstage
            xsum = xsum + b(m) * K(:, m);
        end

        x(:, nt) = x_k + dt * xsum;
    end

end
