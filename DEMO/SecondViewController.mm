//
//  SecondViewController.m
//  DEMO
//
//  Created by starmier on 2019/11/1.
//  Copyright © 2019 yy. All rights reserved.
//

#import "SecondViewController.h"
#include <string>
#include <map>
#include <sys/time.h>

#define USEC_PER_SEC 1000000ull
uint32_t getTime()
{
	struct timeval now;
	gettimeofday(&now, NULL);
	return (uint32_t) (((uint64_t)now.tv_sec * USEC_PER_SEC + now.tv_usec) / 1000);
	
}

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[self test];
	
}

- (void)test{
	
	std::map<uint32_t, std::string> namelist;
	auto ret_pr = namelist.insert(std::make_pair(1, "1111"));
	namelist.insert(ret_pr.first, std::make_pair (2, "2222"));
	namelist[3] = "3333";
	namelist.insert(std::make_pair(4, "4444"));
	namelist.insert(std::make_pair(5, "5555"));

	
	for (std::map<uint32_t, std::string>::iterator iter = namelist.begin(); iter != namelist.end(); iter++)
	{
		uint32_t num = iter->first;
		std::string name = iter->second;
		printf("--0--num :%d, name:%s.\n",num,name.c_str());
	}


	for (std::map<uint32_t, std::string>::iterator iter = namelist.begin(); iter != namelist.end(); ++iter)
	{
		uint32_t num = iter->first;
		std::string name = iter->second;
		printf("--0--num :%d, name:%s.\n",num,name.c_str());
	}
	
}

//查看取值的不同
- (void)testElement{
	
	std::map<uint32_t, std::string> namelist;
	auto ret_pr = namelist.insert(std::make_pair(1, "1111"));
	namelist.insert(ret_pr.first, std::make_pair (2, "2222"));
	namelist[3] = "3333";
	namelist.insert(std::make_pair(4, "4444"));
	namelist.insert(std::make_pair(5, "5555"));
	
	
	for (std::map<uint32_t, std::string>::iterator iter = namelist.begin(); iter != namelist.end(); )//iter++
	{
		uint32_t num = iter->first;
		std::string name = iter->second;
		
		printf("--0--num :%d, name:%s.\n",num,name.c_str());

		printf("--0--num :%d.\n",(iter++)->first);
		
	}

	for (std::map<uint32_t, std::string>::iterator iter = namelist.begin(); iter != namelist.end(); )//++iter
	{
		uint32_t num = iter->first;
		std::string name = iter->second;
		
		printf("--0--num :%d, name:%s.\n",num,name.c_str());

		printf("--0--num :%d.\n",(++iter)->first);
	}
}

//对比两种遍历的耗时
- (void)testTimeCost{
	
	std::map<uint32_t, std::string> namelist;
	
	for (int i = 0; i<1000000; i++)
	{
		namelist.insert(std::make_pair(i, std::to_string(i)));
	}
	
	uint32_t startTime = getTime();
	printf("\n------------------%d-----------------\n", startTime);
	
	for (std::map<uint32_t, std::string>::iterator iter = namelist.begin(); iter != namelist.end();iter++ )
	{
		uint32_t num = iter->first;
		std::string name = iter->second;
		
	}
	
	uint32_t endTime = getTime();
	printf("\n------------------%d(diff:%d)-----------------\n", endTime, endTime-startTime);
	for (std::map<uint32_t, std::string>::iterator iter = namelist.begin(); iter != namelist.end(); ++iter)
	{
		uint32_t num = iter->first;
		std::string name = iter->second;
	}
	uint32_t endTime1 = getTime();
	printf("\n------------------%d(diff:%d)-----------------\n", endTime1, endTime1-endTime);
}



@end
