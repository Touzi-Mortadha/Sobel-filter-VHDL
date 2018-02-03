// author: Ryuuk
#include<bits/stdc++.h>
#define sz(a) int((a).size())
#define pb push_back
#define all(c) (c).begin(),(c).end()
#define tr(c,i) for(typeof((c).begin() i = (c).begin(); i != (c).end(); i++)
#define present(c,x) ((c).find(x) != (c).end())
#define cpresent(c,x) (find(all(c),x) != (c).end())
#define LSOne(i) (i&(-i))
#define REP(i,a,b) for(int(i)=(a);(i)<(b);i++)
#define BUG(x) {cout<<#x<<" = "<<x<<endl;}
#define left(x) (x<<1)
#define right(x) ((x>>1) +1)
#define middle(s,e)(s+(e-s)/2)
#define size_tree(n) 2*(int)pow(2,ceil(log2(n)))
#define CL(A,I) (memset(A,I,sizeof(A)))
#include <unistd.h>



static const int INF = 0x3f3f3f3f;
static const long long INFL = 0x3f3f3f3f3f3f3f3fLL;
static const long double epsilon = 1e-15;
static const long double pi = acos((long double) -1);
using namespace std;
inline void init_io(){ios_base::sync_with_stdio(false);cin.tie(NULL);}


typedef vector<int> vi;
typedef vector<vi> vvi;
typedef pair<int,int> ii;
typedef long long ll;

int width;
int high;
int image[1000][1000];



int main()
{

    freopen("vert.pgm","r",stdin);
   // freopen("output.pgm","w",stdout);

    sleep(3);

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

    int reg_dec_1[width],reg_dec_2[width],reg_dec_3[width];
    CL(reg_dec_1,-1);
    CL(reg_dec_2,-1);
    CL(reg_dec_3,-1);

    //header file
    cout<<"P2\n"<<high<<" "<<width<<"\n255\n";
    //read pgm
    REP(i,0,high)
        REP(j,0,width)
        {

            cout<<"\033[1;34mx= "<<i+1<<" & y= "<<j+1<<"\033[0m"<<endl;
            cin>>image[i][j];
            int reg1,reg2;
            reg1=reg_dec_1[width-1];
            reg2=reg_dec_2[width-1];
            for(int k=width-1;k>0;k--)
            {
                reg_dec_3[k]=reg_dec_3[k-1];
                reg_dec_2[k]=reg_dec_2[k-1];
                reg_dec_1[k]=reg_dec_1[k-1];
            }
            reg_dec_1[0]=image[i][j];
            reg_dec_2[0]=reg1;
            reg_dec_3[0]=reg2;
            cout<< "\033[1;32mregistre décalage 1 :\033[0m \n";
            REP(k,0,width-3)
                cout<< std::setfill (' ') << std::setw (3)<<reg_dec_1[k]<<"|";

            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_1[width-3]<<"\033[0m|";
            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_1[width-2]<<"\033[0m|";
            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_1[width-1]<<"\033[0m|";
            cout<<endl;

            cout<< "\033[1;32mregistre décalage 2 :\033[0m \n";
            REP(k,0,width-3)
                cout<< std::setfill (' ') << std::setw (3)<<reg_dec_2[k]<<"|";

            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_2[width-3]<<"\033[0m|";
            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_2[width-2]<<"\033[0m|";
            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_2[width-1]<<"\033[0m|";
            cout<<endl;

            cout<< "\033[1;32mregistre décalage 3 :\033[0m \n";
            REP(k,0,width-3)
                cout<< std::setfill (' ') << std::setw (3)<<reg_dec_3[k]<<"|";

            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_3[width-3]<<"\033[0m|";
            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_3[width-2]<<"\033[0m|";
            cout<< "\033[1;31m"<< std::setfill (' ') << std::setw (3)<<reg_dec_3[width-1]<<"\033[0m|";

            cout<<endl<<endl;
            cout<<"-----------------------------------------------------------------------------------\n\n";
            sleep(1);
        }


    return 0;
}

