# Character List Application 
- Followed MVVM design pattern
- Separate the view controller from web service call. And easy to add more service in the future.
- Web Service
- Integrate Alamofire. Alamofire requires less code than URLSession and Alamofire offers the feature of requests retrying, which would help the network reachability.
- JSON parse
- Using JSONSerialization, an alternative would be Decodable
- Handling error with customized enum conforming to Error protocol
- Prepared configuration files for each target.
- Each target share the same bode base but can be applied with different configs.
By Jan Tong

