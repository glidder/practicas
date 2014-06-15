#include <iostream>
#include <string>
#include <math.h>
#include <vector>

using namespace std;

static int const POP=10;
static int const ITERA= 1000;
static int const TOP= 40;
static int const BOT= 0;
//static int const PCROSS= 2;
//static int const PMUT =1;
static int const BETA= 4;

vector<double> initialPopulation(int);
vector<double> geneticAlgorithm(vector<double>);
vector<double> nitchingGeneticAlgorithm(vector<double>);
vector<double> evaluate(vector<double>);
int 	 getBest(vector<double>);
double	 mean(vector<double>);
vector<double> selectParents(vector<double>); //Roulette
vector<double> combine(vector<double>); //lineal convex combination
vector<double> mutate(vector<double>); //Gaussian mutation
vector<double> replace(vector<double>, vector<double>);

int main(int argc, char *argv[])
{
	srand(time(NULL));
	int n =((argc >= 2)?atoi(argv[1]):POP);

	//if(argc >= 2)
	//	n = atoi(argv[1]);
	//else{
	//	cout << "Size of the population: ";
	//	cin >> n;
	//}

	vector<double> s(n), c(n), population = initialPopulation(n);

	s = geneticAlgorithm(population);
	c= evaluate(s);
	cout <<"Genetic Algorithm\n-----------------------\nAverage cost: "<< mean(c)<<endl;
	int p= getBest(c);
	cout<<"Best result: "<<s[p]<<", with cost: "<<c[p]<<endl;

	s = nitchingGeneticAlgorithm(population);
	c= evaluate(s);
	cout <<"\nNitching Genetic Algorithm\n-----------------------\nAverage cost: "<<mean(c)<<endl;
	p= getBest(c);
	cout<<"Best result: "<<s[p]<<", with cost: "<<c[p]<<endl;

}

vector<double> initialPopulation(int n){
	vector<double> population(n);
	for(int i=0; i<n;++i)
		population[i]=(rand() % TOP) + BOT;
	//for(int i=0; i<n; ++i)
	//	cout<<population[i]<<" ";
	//cout<<endl;
	return population;
}

vector<double> geneticAlgorithm(vector<double> population){
	vector<double> desc(2), newpopulation = population;
	int i=0,e;
	while (i++<ITERA){ //Placeholder!!!!!!!!!!!!!!!!
		desc = mutate(combine(selectParents(newpopulation)));
		newpopulation = replace(newpopulation, desc);
		//cin>>e;
		for (int i=0;i<newpopulation.size();++i)
			cout<<newpopulation[i]<<" ";
		cout<<endl;
		vector<double> c=evaluate(newpopulation);
		double t=0;
		for (int i=0;i<newpopulation.size();++i){
			cout<<c[i]<< " ";
			t+=c[i];
		}
		cout<<" = "<<t<<endl;
	}
	return newpopulation;
}

vector<double> nitchingGeneticAlgorithm(vector<double> population){
	vector<double> newpopulation= population;
	return newpopulation;
}

vector<double> evaluate(vector<double> population){
	vector<double> out(population.size());
	for (int i=0;i<population.size();++i){
		out[i]=pow(sin(population[i]),2)-sin(population[i]);
		//cout<<out[i]<<" ";
	}
	//cout<<endl;
	return out;
}

int 	 getBest(vector<double> cost){
	int out=0;
	for(int i=1;i<cost.size();++i)
		if(cost[i]>cost[out]) out=i;
	return out;
}

double	 mean(vector<double> costs){
	double t=0;
	for(int i=0;i<costs.size();++i)
		t+=costs[i];
	//cout<<"TOTAL: "<<t<<endl;
	return t/costs.size();
}

vector<double> selectParents(vector<double> population){
	vector<double> roulette(population.size()), c=evaluate(population);
	vector<double> out(2);
	double t=0;
	int j=0;
	for(int i=0;i<population.size();++i){
		t+=c[i];
		roulette[i]=t;
		//cout<<population[i]<<"= "<<roulette[i]<<" ";
	}
	//cout<<"\n t: "<<t<<" "<<((int)t)<<endl;
	double ticket = rand() % ((int)t);
	/*for(int i=0;i<population.size();++i){
		if (roulette[i]>=ticket){
			out[j]=population[i];
			ticket = rand() % ((int)t);
			i=j++*population.size();
		}
	}*/
	//cout<<"\nt: "<<((int)t)<<" ticket: "<<ticket<<endl;
	for(int i=0;i<population.size();++i){
		if(roulette[i]>=ticket){
			out[0]=population[i];
			i+=population.size();
		}
	}
	ticket = rand() % ((int)t);
	//cout<<"t: "<<((int)t)<<" ticket: "<<ticket<<endl;
	for(int i=0;i<population.size();++i){
		if(roulette[i]>=ticket){
			out[1]=population[i];
			i+=population.size();
		}
	}
	return out;
}

vector<double> combine(vector<double> parents){
	int alpha=rand() % 2;
	vector<double> out={parents[0]*alpha+parents[1]*(1-alpha), parents[0]*(1-alpha)+parents[1]*alpha};
	//cout<<parents[0]<<" "<<parents[1]<<": "<<out[0]<<" "<<out[1]<<endl;
	return out;
}

vector<double> mutate(vector<double> population){
	int alpha=((rand() %2)?1:-1);
	vector<double> out(population.size());
	for (int i=0;i<population.size();++i){
		out[i]=population[i]+alpha*BETA;
		if(out[i]>=TOP)out[i]=TOP-1;
		else if(out[i]<BOT)out[i]=BOT;
	}
	return out;
}

vector<double> replace(vector<double>population, vector<double> newpop){
	vector<double> out=population, c=evaluate(population);
	int a=((c[1]<c[0])?1:0), b=1-a;
	for (int i=0; i<population.size();++i){
		if (c[i]<=c[a]){
			b=a;a=i;
		}
	}
	out[a]=newpop[0]; out[b]=newpop[1];
	return out;
}
