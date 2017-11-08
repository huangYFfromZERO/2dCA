clc;
clear;
n=9;                           %道路数量
times=300;                            %迭代次数
vmax=5;                              %所允许的最大速度
roads=zeros(30)-1;                   %整体矩阵
roadph=zeros(30);
roadnumlength=zeros(1,n);            %道路长度矩阵
roadnumlength(1)=29;
roadnumlength(2)=29;
roadnumlength(3)=29;
roadnumlength(4)=29;
roadnumlength(5)=7;
roadnumlength(6)=39;
roadnumlength(7)=38;
roadnumlength(8)=34;
roadnumlength(9)=10;
maxlength=39;                         %定义最长道路，k需要再给。
roadzhuan=zeros(n,maxlength);
road1data=zeros(300,roadnumlength(1));
road2data=zeros(300,roadnumlength(2));
road3data=zeros(300,roadnumlength(3));
road4data=zeros(300,roadnumlength(4));
road5data=zeros(300,roadnumlength(5));
road6data=zeros(300,roadnumlength(6));
road7data=zeros(300,roadnumlength(7));
road8data=zeros(300,roadnumlength(8));
road9data=zeros(300,roadnumlength(9));
roadave1=zeros(2,300);
roadave2=zeros(2,300);
roadave3=zeros(2,300);
roadave4=zeros(2,300);
roadave5=zeros(2,300);
roadave6=zeros(2,300);
roadave7=zeros(2,300);
roadave8=zeros(2,300);
roadave9=zeros(2,300);
road1spdata=zeros(300,roadnumlength(1));
road2spdata=zeros(300,roadnumlength(2));
road3spdata=zeros(300,roadnumlength(3));
road4spdata=zeros(300,roadnumlength(4));
road5spdata=zeros(300,roadnumlength(5));
road6spdata=zeros(300,roadnumlength(6));
road7spdata=zeros(300,roadnumlength(7));
road8spdata=zeros(300,roadnumlength(8));
road9spdata=zeros(300,roadnumlength(9));
spave1=zeros(2,300);
spave2=zeros(2,300);
spave3=zeros(2,300);
spave4=zeros(2,300);
spave5=zeros(2,300);
spave6=zeros(2,300);
spave7=zeros(2,300);
spave8=zeros(2,300);
spave9=zeros(2,300);
s=0;                                  %道路车辆和计算变量
l=0;                                  %道路长度计算变量
vs=0;                                  %和速度计算变量
%roadaddhang=zeros(2,maxlength);      %定义各路段的位置的行坐标，（x，y）其中x为第几号道路，y为这个标号道路的位置，储存值为x号道路y位置在二维roads中的横坐标
%roadaddlie=zeros(2,maxlength);       %定义各路段的位置的行坐标，（x，y）其中x为第几号道路，y为这个标号道路的位置，储存值为x号道路y位置在二维roads中的列坐标
roadaddlie=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 0 0 0 0 0 0 0 0 0 0
            30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 0 0 0 0 0 0 0 0 0 0
            29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0 0 0 0 0 0 0 0 0 0
            1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
            10 10 10 10 10 10 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
            4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 20 20 20 20 20 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4
            4 4 4 4 4 4 4 4 4 4 4 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 0
            25 25 25 25 25 25 25 25 25 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0 0 0 0 0
            13 13 13 13 13 13 13 13 13 13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
roadaddhang=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0;
             1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 0 0 0 0 0 0 0 0 0 0;
             30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 30 0 0 0 0 0 0 0 0 0 0;
             30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 0 0 0 0 0 0 0 0 0 0;
             1 2 3 4 5 6 7 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
             8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 9 10 11 12 13 14 14 14 14 14 14 14 14 14 14 14 14 14 14 14 14 14;
             8 9 10 11 12 13 14 15 16 17 18 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 0 ;
             19 20 21 22 23 24 25 26 27 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 28 0 0 0;
             28 27 26 25 24 23 22 21 20 19 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
             ]             
road=zeros(n,maxlength);             %定义所有道路
v_road=zeros(n,maxlength);
roadup=zeros(n,maxlength);           %用于存储不同道路距离前车的距离
roaddown=zeros(n,maxlength);         %用于储存不同道路距离后车的距离
flag=0;                               %中间过程的判断变量
p=0.3;                               %随机慢化概率，之后可以再进行修改
incr=0;                              %道路位置增加量，中间使用变量
vadd=0;
r1=0;                                %转向点坐标转换中间参数
r2=0;                                %转向点坐标转换中间参数
w1=1;                                %转向点坐标转换中间参数
w2=2;                                %转向点坐标转换中间参数
y=0;                                 %转向点坐标查找参数
j=0;                                 %转向坐标交换参数
for z=1:n                            %道路初始化  road和roads
    for j=1:roadnumlength(z)
        road(z,j)=round(rand(1,1));  %此处为初始的随机赋值，车辆出现概率可以进行调整。  且初始化完毕后有车的地方为道路编号，没车为0，非道路为-1.
        if roads(roadaddhang(z,j),roadaddlie(z,j))==-1
            roads(roadaddhang(z,j),roadaddlie(z,j))=z;
            continue;
        end
        if roads(roadaddhang(z,j),roadaddlie(z,j))~=z
            roads(roadaddhang(z,j),roadaddlie(z,j))=roads(roadaddhang(z,j),roadaddlie(z,j))*10+z+j*i;              %交叉点设置完毕,此处还利用虚数进行记忆。利用虚数来储存分叉点，使得分叉点不会混淆。
            continue;
        end
    end
end
for z=1:2                                                                  %有车无车的判断
    for j=1:roadnumlength(z)
        if roads(roadaddhang(z,j),roadaddlie(z,j))>10;
            continue;
        end
        if road(z,j)==0
            roads(roadaddhang(z,j),roadaddlie(z,j))=0;
        end
    end
end
for z=1:n                                                                  %保证分叉点上一定没车
    for j=1:roadnumlength(z)
        if roads(roadaddhang(z,j),roadaddlie(z,j))>10
            road(z,j)=0;
        end
    end
end
v_roads=zeros(30);                                %新的速度储存矩阵
for z=1:n                            %速度初始化                     
    for j=1:roadnumlength(z)
        if road(z,j)>0
            v_road(z,j)=1;
            v_roads(roadaddhang(z,j),roadaddlie(z,j))=1;
        end
    end
end
for z=1:n
    for j=1:roadnumlength(z)-1
        for t=j+1:roadnumlength(z)
            if roads(roadaddhang(z,t),roadaddlie(z,t))>10
                roadzhuan(z,j)=t-j;
                break;
            end
        end
    end
end
%到此，整个程序的初始化完成。基本可以较好的对整个路段进行初始化
for z=1:30
    for j=1:30
        roadph(z,j)=real(roads(z,j));
    end
end 
ph=imshow(roadph);                                            %设置初始情况
for z=1:times                                              %赋值完成以后开始进行迭代  
    for t=1:n                                                  %检测每个道路元胞前后方的车辆位置（每次迭代之后都要进行一次更新）
        for j=1:roadnumlength(t)
            if j==roadnumlength(t)
                roadup(t,j)=200;                               %如果这辆车是道路上边界的车，那它开多快都无所谓
                continue;
            end
                for o=(j+1):roadnumlength(t)
                    if road(t,o)>0                             %判断前方是否有车及车辆位置
                        roadup(t,j)=o-j;
                        break;
                    end
                    if o==roadnumlength(t)
                        roadup(t,j)=200;
                    end
                end
            if j==1
                roaddown(t,j)=200;                             %如果这辆车是道路下边界的车，那永远不用担心被后面车撞
                continue;
            end
                for o=(j-1):1
                    if road(t,o)>0                             %判断后方是否有车及车辆位置
                        roaddown(t,j)=j-o;
                        break;
                    end
                end
        end
    end
    if roadzhuan(t,j)<incr&&roadzhuan(t,j)~=0&&roadup(t,j)>100                                          %可以发生转向
        r1=floor(real(roads(roadaddhang(t,j+roadzhuan(t,j)),roadaddlie(t,j+roadzhuan(t,j))))/10);             %先进行
        r2=real(roads(roadaddhang(t,j+roadzhuan(t,j)),roadaddlie(t,j+roadzhuan(t,j))))-10*r1;
        if r1==t
            w1=j;
            for y=1:roadnumlength(r2)
                if roads(roadaddhang(r2,y),roadaddlie(r2,y))==roads(roadaddhang(r1,w1),roadaddlie(r1,w1))
                    w2=y;
                end
            end
         end
         if r2==t;
            w2=j;
            for y=1:roadnumlength(r1)
                if roads(roadaddhang(r1,y),roadaddlie(r1,y))==roads(roadaddhang(r2,w2),roadaddlie(r2,w2))
                    w1=y;                                                                                    %此处做交换使得两次带有t，j的都是r1，w1
                    j=r1;
                    r1=r2;
                    r2=j;
                    j=w1;
                    w1=w2;
                    w2=j;
                 end
            end
         end
          if  (roadup(r1,w1)<roadup(r2,w2))&&road(r2,w2+1)==0||r1==1||r1==2||r1==3||r1==4          %满足以下条件时才可发生转向
            road(r2,w2+1)=1;
            roads(roadaddhang(r2,w2+1),roadaddlie(r2,w2+1))=r2;
            v_roads(roadaddhang(r2,w2+1),roadaddlie(r2,w2+1))=1;
            v_road(r2,w2+1)=1;
            road(r1,w1)=0;
            roads(roadaddhang(r1,w1),roadaddlie(r1,w1))=0;
            v_roads(roadaddhang(r1,w1),roadaddlie(r1,w1))=0;
            v_road(r1,w1)=0;
            continue;
          end
          if incr+j>roadnumlength(t)&&roadzhuan(t,j)~=0                                             %必须要转向时的情况
             road(r2,w2)=1;
             roads(roadaddhang(r2,w2+1),roadaddlie(r2,w2+1))=r2;
             v_roads(roadaddhang(r2,w2+1),roadaddlie(r2,w2+1))=1;
             v_roads(roadaddhang(r2,w2+1),roadaddlie(r2,w2+1))=1;
             road(r1,w1)=0;
             roads(roadaddhang(r1,w1),roadaddlie(r1,w1))=0;
             v_roads(roadaddhang(r1,w1),roadaddlie(r1,w1))=0;
             v_road(r1,w1)=0;
             continue;
          end
    end                                                     %判断是否要发生转向
    
    for t=1:n                                              %各个元胞进行速度变化
        for j=roadnumlength(t):-1:1
            if road(t,j)>0
                incr=v_road(t,j);
                if j+incr>roadnumlength(t)                    %检验车是否达到道路出口
                    road(t,j)=0;
                    v_road(t,j)=0;
                    roads(roadaddhang(t,j),roadaddlie(t,j))=0;
                    v_roads(roadaddhang(t,j),roadaddlie(t,j))=0;
                    continue;                              %若车出去则无后续移动
                end
                road(t,j+incr)=1;       %储存矩阵储存新的元胞运动到了那里
                road(t,j)=0;
                vadd=incr;
                roads(roadaddhang(t,j+vadd),roadaddlie(t,j+vadd))=t;
                roads(roadaddhang(t,j),roadaddlie(t,j))=0;
                if incr<vmax                              %汽车的加速过程
                    incr=incr+1;
                end
                if incr>roadup(t,j)
                    incr=max(road(t,j)-1,1);                      %这里的减速需要进行讨论，到底需不需要去减这个1
                end
                if p>rand(1,1)
                    incr=max(incr-1,1);                    %随机慢化
                end
                v_road(t,j)=0;
                v_roads(roadaddhang(t,j),roadaddlie(t,j));
                v_road(t,j+vadd)=incr;
                v_roads(roadaddhang(t,j+vadd),roadaddlie(t,j+vadd))=incr;                      %储存矩阵储存新的速度值大小
            end
        end
    end
 for k=1:30
    for j=1:30
        roadph(k,j)=real(roads(k,j));
    end
 end 
for j=1:roadnumlength(1)
    s=0;
    l=roadnumlength(1);
    road(1,j)=road1data(z,j);
    for k=1:roadnumlength(1)
        if road(1,k)>0
            s=s+1;
        end
    end
    roadave1(1,z)=z;
    roadave1(2,z)=s/l;
end
for j=1:roadnumlength(2)
    s=0;
    l=roadnumlength(2);
    road(2,j)=road2data(z,j);
    for k=1:roadnumlength(2)
        if road(2,k)>0
            s=s+1;
        end
    end
    roadave2(1,z)=z;
    roadave2(2,z)=s/l;
end
for j=1:roadnumlength(3)
    s=0;
    l=roadnumlength(3);
    road(3,j)=road3data(z,j);
    for k=1:roadnumlength(3)
        if road(3,k)>0
            s=s+1;
        end
    end
    roadave3(1,z)=z;
    roadave3(2,z)=s/l;
end
for j=1:roadnumlength(4)
     s=0;
    l=roadnumlength(4);
    road(4,j)=road4data(z,j);
    for k=1:roadnumlength(4)
        if road(4,k)>0
            s=s+1;
        end
    end
    roadave4(1,z)=z;
    roadave4(2,z)=s/l;
end
for j=1:roadnumlength(5)
     s=0;
    l=roadnumlength(5);
    road(5,j)=road5data(z,j);
    for k=1:roadnumlength(5)
        if road(5,k)>0
            s=s+1;
        end
    end
    roadave5(1,z)=z;
    roadave5(2,z)=s/l;
end
for j=1:roadnumlength(6)
    road(6,j)=road6data(z,j);
     s=0;
    l=roadnumlength(6);
    road(6,j)=road6data(z,j);
    for k=1:roadnumlength(2)
        if road(2,k)>0
            s=s+1;
        end
    end
    roadave6(1,z)=z;
    roadave6(1,z)=s/l;
end
for j=1:roadnumlength(7)
    road(7,j)=road6data(z,j);
     s=0;
    l=roadnumlength(7);
    road(7,j)=road7data(z,j);
    for k=1:roadnumlength(7)
        if road(7,k)>0
            s=s+1;
        end
    end
    roadave7(1,z)=z;
    roadave7(2,z)=s/l;
end
for j=1:roadnumlength(8)
    road(8,j)=road6data(z,j);
     s=0;
    l=roadnumlength(8);
    road(8,j)=road8data(z,j);
    for k=1:roadnumlength(8)
        if road(8,k)>0
            s=s+1;
        end
    end
    roadave8(1,z)=z;
    roadave8(2,z)=s/l;
end
for j=1:roadnumlength(9)
    road(9,j)=road9data(z,j);
     s=0;
    l=roadnumlength(9);
    road(9,j)=road9data(z,j);
    for k=1:roadnumlength(9)
        if road(9,k)>0
            s=s+1;
        end
    end
    roadave9(1,z)=z;
    roadave9(2,z)=s/l;
end
for j=1:roadnumlength(1)
    s=0;vs=0;
    v_road(1,j)=road1spdata(z,j);
    for k=1:roadnumlength(1)
        if road(1,k)>0
            s=s+1;
            vs=vs+v_road(1,k);
        end
    end
    spave1(1,z)=z;
    spave1(2,z)=vs/s;
end
for j=1:roadnumlength(2)
    s=0;vs=0;
    v_road(2,j)=road2spdata(z,j);
    for k=1:roadnumlength(2)
        if road(2,k)>0
            s=s+1;
            vs=vs+v_road(2,k);
        end
    end
    spave1(1,z)=z;
    spave1(2,z)=vs/s;
end
for j=1:roadnumlength(3)
    s=0;vs=0;
    v_road(3,j)=road3spdata(z,j);
    for k=1:roadnumlength(3)
        if road(3,k)>0
            s=s+1;
            vs=vs+v_road(3,k);
        end
    end
    spave1(3,z)=z;
    spave1(3,z)=vs/s;
end
for j=1:roadnumlength(4)
     s=0;
    l=roadnumlength(4);
    road(4,j)=road4data(z,j);
    for k=1:roadnumlength(4)
        if road(4,k)>0
            s=s+1;
        end
    end
    roadave4(1,z)=z;
    roadave4(2,z)=s/l;
end
for j=1:roadnumlength(5)
    s=0;vs=0;
    v_road(5,j)=road5spdata(z,j);
    for k=1:roadnumlength(5)
        if road(5,k)>0
            s=s+1;
            vs=vs+v_road(5,k);
        end
    end
    spave5(1,z)=z;
    spave5(2,z)=vs/s;
end
for j=1:roadnumlength(6)
    s=0;vs=0;
    v_road(6,j)=road6spdata(z,j);
    for k=1:roadnumlength(6)
        if road(6,k)>0
            s=s+1;
            vs=vs+v_road(6,k);
        end
    end
    spave6(1,z)=z;
    spave6(2,z)=vs/s;
end
for j=1:roadnumlength(7)
    s=0;vs=0;
    v_road(7,j)=road7spdata(z,j);
    for k=1:roadnumlength(7)
        if road(7,k)>0
            s=s+1;
            vs=vs+v_road(7,k);
        end
    end
    spave7(1,z)=z;
    spave7(2,z)=vs/s;
end
for j=1:roadnumlength(8)
    s=0;vs=0;
    v_road(8,j)=road8spdata(z,j);
    for k=1:roadnumlength(8)
        if road(8,k)>0
            s=s+1;
            vs=vs+v_road(8,k);
        end
    end
    spave8(1,z)=z;
    spave8(2,z)=vs/s;
end
for j=1:roadnumlength(9)
    s=0;vs=0;
    v_road(9,j)=road9spdata(z,j);
    for k=1:roadnumlength(9)
        if road(9,k)>0
            s=s+1;
            vs=vs+v_road(9,k);
        end
    end
    spave9(1,z)=z;
    spave9(2,z)=vs/s;
end
end
road1data
roadave1
roadave2
roadave3
roadave4
roadave5
roadave6
roadave7
roadave8
roadave9
spave1
spave2
spave3
spave4
spave5
spave6
spave7
spave8
spave9
