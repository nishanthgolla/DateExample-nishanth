//
//  ViewController.m
//  DateExample
//
//  Created by nishanth golla on 12/22/15.
//  Copyright © 2015 nishanth golla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *apiUrl;
    NSString *timestamp;
    NSData *amazonData;
    NSXMLParser *amazonXML;
    NSString *temp;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.
    NSString *query = @"Harry Potter";
//Timestamp
    NSDateFormatter *dateFormatter1=[[NSDateFormatter alloc]init];
    [dateFormatter1 setDateFormat:@"YYYY-MM-dd"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter1 setTimeZone:timeZone];
    NSString *timestamp1 = [dateFormatter1 stringFromDate:[NSDate date]];
    NSLog(@"Timestamp: %@",timestamp1);
    
    NSDateFormatter *dateFormatter2=[[NSDateFormatter alloc]init];
    [dateFormatter2 setDateFormat:@"HH:mm:ss"];
    NSTimeZone *timeZone2 = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter2 setTimeZone:timeZone2];
    NSString *timestamp2 = [dateFormatter2 stringFromDate:[NSDate date]];
    NSLog(@"Timestamp: %@",timestamp2);
    
    timestamp = [[NSString alloc]initWithFormat: @"%@T%@Z",timestamp1,timestamp2 ];
    NSLog(@"Final: %@",timestamp);
    
    
    
//    //APIrequest and XML Parsing initization
  apiUrl = [[NSString alloc]initWithFormat:@"http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyId=AKIAIBRITAZDANDFPXKQ&AssociateTag=bookb0a4-20&Operation=ItemSearch&Keywords=%@&SearchIndex=Books&Timestamp%@&Signature=+NFXlMlckU62R8CcKSfIbFh46BP0Llv8QIp+LdIT",query,timestamp];
     NSLog(@"apiurl:%@",apiUrl);
 //   apiUrl=[[NSString alloc]initWithFormat:@"https://www.google.com"];
 
    NSString* webStringURL = [apiUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

     NSURL *amazonURL = [NSURL  URLWithString:webStringURL];
     NSLog(@"amazonURL: %@",apiUrl);
     amazonData=[NSData dataWithContentsOfURL:amazonURL];
     NSLog(@"amazonData: %@",amazonData);
//   amazonXML =[[NSXMLParser alloc]initWithData:amazonData];
//   NSLog(@"amazonXML : %@",amazonXML);
//[amazonXML setDelegate:self];
//    [amazonXML parse];
    _webView.delegate=self;
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:amazonURL];
    [_webView loadRequest:requestObj];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
