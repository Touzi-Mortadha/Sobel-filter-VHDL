// author: Ryuuk
#include<bits/stdc++.h>

#define REP(i,a,b) for(int(i)=(a);(i)<(b);i++)
#define BUG(x) {cout<<#x<<" = "<<x<<endl;}

using namespace std;

int image[1000][1000];
int sobel_x[3][3]={{-1,0,1},{-2,0,2},{-1,0,1}};
int sobel_y[3][3]={{-1,-2,-1},{0,0,0},{1,2,1}};


//#define width 20
//#define high 20
int width;
int high;


int sobel(int x,int y)
{
    int gx=0,gy=0;

    gx=(sobel_x[0][0] * image[x-1][y-1]) + (sobel_x[0][1] * image[x][y-1]) + (sobel_x[0][2] * image[x+1][y-1]) +
    (sobel_x[1][0] * image[x-1][y])   + (sobel_x[1][1] * image[x][y])   + (sobel_x[1][2] * image[x+1][y]) +
    (sobel_x[2][0] * image[x-1][y+1]) + (sobel_x[2][1] * image[x][y+1]) + (sobel_x[2][2] * image[x+1][y+1]);

    gy= (sobel_y[0][0] * image[x-1][y-1]) + (sobel_y[0][1] * image[x][y-1]) + (sobel_y[0][2] * image[x+1][y-1]) +
        (sobel_y[1][0] * image[x-1][y])   + (sobel_y[1][1] * image[x][y])   + (sobel_y[1][2] * image[x+1][y]) +
        (sobel_y[2][0] * image[x-1][y+1]) + (sobel_y[2][1] * image[x][y+1]) + (sobel_y[2][2] * image[x+1][y+1]);

//    int tmp=gx*gx+gy*gy;
    int tmp=abs(gx)+abs(gy);
    int res = tmp;
//    int res = int(sqrt(tmp));
    if(res> 255)
        return 255;
    else if(res<0)
        return 0 ;
    return res;
}


int main()
{
    //you need to delete the header of pgm image before read it
    freopen("baboon.pgm","r",stdin);
    freopen("output.pgm","w",stdout);

    int header_lingne=0;
    string s;
    while(header_lingne<3)
    {
        getline(cin,s);
        if(s[0]=='#')
            continue;
        else if( header_lingne==1)
        {
            stringstream ss(s);
            ss>>high;
            ss>>width;
        }
        header_lingne++;
    }


    //header file
    cout<<"P2\n"<<high-2<<" "<<width-2<<"\n255\n";

    //read pgm
    REP(i,0,high)
        REP(j,0,width)
            cin>>image[i][j];

    REP(i,1,high-1)
    {
        REP(j,1,width-2)
            cout<<sobel(i,j)<<" ";
        cout<<sobel(i,width-2)<<endl;

    }
    return 0;
}

