//
//  FLNetworkTool.swift
//  FLNews
//
//  Created by 凤梨 on 2019/4/15.
//  Copyright © 2019年 2dfire. All rights reserved.
//

import Foundation

protocol NetworkToolProtocol {
    // MARK: - --------------------------------- 首页 home  ---------------------------------
    
    //首页顶部新闻标题的数据
    static func loadHomeNewsTitleData(completionHandler:@escaping (_ newTitles:[HomeNewsTitle])->())
    //点击首页加号按钮，获取频道推荐数据
    static func loadHomeCategoryRecommend(completionHandler:@escaping (_ newTitles:[HomeNewsTitle])->())
    //首页顶部导航栏搜索推荐标题内容
    static func loadHomeSearchSuggestInfo(_ completionHandler: @escaping (_ searchSuggest: String) -> ())
    //获取首页、视频、小视频的新闻列表数据
    static func loadApiNewsFeeds(category:NewsTitleCategory, ttFrom:TTFrom, _ completionHandler:@escaping(_ maxBehotTime:TimeInterval, _ news:[NewsModel])->())
    //获取首页、视频、小视频的新闻列表数据,加载更多
    static func loadMoreApiNewsFeeds(category: NewsTitleCategory, ttFrom: TTFrom, maxBehotTime: TimeInterval, listCount: Int, _ completionHandler: @escaping (_ news: [NewsModel]) -> ())
    //获取一般新闻详情数据
    static func loadCommenNewsDetail(articleURL:String, completionHandler:@escaping(_ htmlString:String, _ images:[NewsDetailImage], _ abstracts:[String])->())
    //获取图片新闻详情数据
    static func loadNewsDetail(articleURL:String, completionHandler:@escaping(_ images:[NewsDetailImage], _ abstracts:[String])->())
}

