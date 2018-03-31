%%
clear all;
close all;

%%
n0 = dlmread('flux0.dat',',',1,1); % N=0
n1 = dlmread('flux1.dat',',',1,1); % no set defect eps
n2 = dlmread('flux2.dat',',',1,1); % eps=15
n3 = dlmread('flux3.dat',',',1,1); % eps=11

p0 = n0(:,2);
p1 = n1(:,2);
p2 = n2(:,2);
p3 = n3(:,2);

f = n0(:,1);

norm1 = p1./p0;
%norm1 = smooth(norm1,30,'lowess');
norm2 = p2./p0;
norm3 = p3./p0;

n00 = dlmread('flux00.dat',',',1,1); % N = 3+3, d=1
p00 = n00(:,2);
norm00 = p00./p0;
%%

plot(f,norm1,'r',f,norm2,'g',f,norm3,'b',f,norm00,'y');
axis([0.15 0.35 0 1])
title('Transmission Spectrum(N=3)')
xlabel('Frequency')
ylabel('Normalized Transmission')
legend('eps=13','eps=15','eps=11','no defect');

axes('position', [0.525 0.55 0.2 0.3])

plot(f,norm1,'r',f,norm2,'g',f,norm3,'b',f,norm00,'y');
axis([0.225 0.245 0 0.9])
%title('Transmission Spectrum')
%xlabel('Frequency')
%ylabel('Normalized Transmission')

%%
n_4h_d1 = dlmread('flux_N4_d1.dat',',',1,1); % N = 4+4, d=1
p_4h_d1 = n_4h_d1(:,2);
norm_4h_d1 = p_4h_d1./p0;

% n0 is still n0
n11 = dlmread('flux_N4_eps13.dat',',',1,1); % no set defect eps
n22 = dlmread('flux_N4_eps15.dat',',',1,1); % eps=15
n33 = dlmread('flux_N4_eps11.dat',',',1,1); % eps=11

p11 = n11(:,2);
p22 = n22(:,2);
p33 = n33(:,2);

norm11 = p11./p0;
%norm1 = smooth(norm1,30,'lowess');
norm22 = p22./p0;
norm33 = p33./p0;
%%
figure
plot(f,norm11,'r',f,norm22,'g',f,norm33,'b',f,norm_4h_d1,'y');
axis([0.15 0.35 0 1])
title('Transmission Spectrum(N=4)')
xlabel('Frequency')
ylabel('Normalized Transmission')
legend('eps=13','eps=15','eps=11','no defect');

axes('position', [0.52 0.55 0.2 0.3])
plot(f,norm11,'r',f,norm22,'g',f,norm33,'b',f,norm_4h_d1,'y');
axis([0.225 0.245 0 0.4])
%title('Transmission Spectrum')
%xlabel('Frequency')
%ylabel('Normalized Transmission')

%%
nchi001 = dlmread('flux_chi_amp2_Ey.dat',',',1,1);
nchi01 = dlmread('flux_chi_fc026.dat',',',1,1);
nsgl = dlmread('flux_chi_singleSrc.dat',',',1,1);
pchi001 = nchi001(:,2);
pchi01 = nchi01(:,2);
psgl = nsgl(:,2);
%pp = pchi - psgl;
normchi001 = pchi001./p0;
normchi01 = pchi01./p0;
figure
plot(f,normchi001,'b',f,normchi01+1,'g',f,norm1+2,'r')
%axis([0.23 0.24 0 5])



