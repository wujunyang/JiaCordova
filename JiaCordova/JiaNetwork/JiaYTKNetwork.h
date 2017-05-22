//
//  YTKNetwork.h
//
//  Copyright (c) 2012-2016 YTKNetwork https://github.com/yuantiku
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <Foundation/Foundation.h>

#ifndef _YTKNETWORK_
    #define _YTKNETWORK_

#if __has_include(<YTKNetwork/JiaYTKNetwork.h>)

    FOUNDATION_EXPORT double JiaYTKNetworkVersionNumber;
    FOUNDATION_EXPORT const unsigned char JiaYTKNetworkVersionString[];

    #import <YTKNetwork/JiaYTKRequest.h>
    #import <YTKNetwork/JiaYTKBaseRequest.h>
    #import <YTKNetwork/JiaYTKNetworkAgent.h>
    #import <YTKNetwork/JiaYTKBatchRequest.h>
    #import <YTKNetwork/JiaYTKBatchRequestAgent.h>
    #import <YTKNetwork/JiaYTKChainRequest.h>
    #import <YTKNetwork/JiaYTKChainRequestAgent.h>
    #import <YTKNetwork/JiaYTKNetworkConfig.h>

#else

    #import "JiaYTKRequest.h"
    #import "JiaYTKBaseRequest.h"
    #import "JiaYTKNetworkAgent.h"
    #import "JiaYTKBatchRequest.h"
    #import "JiaYTKBatchRequestAgent.h"
    #import "JiaYTKChainRequest.h"
    #import "JiaYTKChainRequestAgent.h"
    #import "JiaYTKNetworkConfig.h"

#endif /* __has_include */

#endif /* _YTKNETWORK_ */
