#include <iostream>
#include <string>
#include <math.h>
#include <vector>

using namespace std;

static int const POP=5;
static int const ITERA= 1000;
static int const TOP= 40;
static int const BOT= 0;
//static int const PCROSS= 2;
//static int const PMUT =1;
static int const BETA= 1;

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
	return population;
}

vector<double> geneticAlgorithm(vector<double> population){
	vector<double> desc(2), newpopulation = population;
	int i=0;
	while (i++<ITERA){ //Placeholder!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		desc = mutate(combine(selectParents(newpopulation)));
		newpopulation = replace(newpopulation, desc);
	}
	return newpopulation;
}

vector<double> nitchingGeneticAlgorithm(vector<double> population){
	vector<double> newpopulation= population;
	return newpopulation;
}

vector<double> evaluate(vector<double> population){
	vector<double> out(population.size());
	for (int i=0;i<population.size();++i)
		out[i]=pow(sin(population[i]),2)-sin(population[i]);
	return out;
}

int 	 getBest(vector<double> population){
	int out=0;
	for(int i=1;i<population.size();++i)
		if(population[i]>population[out]) out=i;
	return out;
}

double	 mean(vector<double> population){
	int t=0;
	for(int i=0;i<population.size();++i)
		t+=population[i];
	return t/population.size();
}

vector<double> selectParents(vector<double> population){
	vector<double> roulette(population.size()), c=evaluate(population);
	vector<double> out(2);
	double t=0;
	int j=0;
	for(int i=0;i<population.size();++i){
		t+=c[i];
		roulette[i]=t;
	}
	double ticket = rand() % ((int)t);
	for(int i=0;i<population.size();++i){
		if (roulette[i]>=ticket){
			i=j*population.size();
			out[j++]=population[i];
		}
	}
	return out;
}

vector<double> combine(vector<double> parents){
	int alpha=rand() % 2;
	vector<double> out={parents[0]*alpha+parents[1]*(1-alpha), parents[0]*(1-alpha)+parents[1]*alpha};
	return out;
}

vector<double> mutate(vector<double> population){
	int alpha=((rand() %2)?1:-1);
	vector<double> out(population.size());
	for (int i=0;i<population.size();++i)
		out[i]=population[i]+alpha*BETA;
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