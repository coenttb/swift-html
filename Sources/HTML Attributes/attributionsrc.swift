//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation

//attributionsrc Experimental
//Specifies that you want the browser to send an Attribution-Reporting-Eligible header. On the server-side this is used to trigger sending an Attribution-Reporting-Register-Source header in the response, to register a navigation-based attribution source.
//
//The browser stores the source data associated with the navigation-based attribution source (as provided in the Attribution-Reporting-Register-Source response header) when the user clicks the link. See the Attribution Reporting API for more details.
//
//There are two versions of this attribute that you can set:
//
//Boolean, i.e. just the attributionsrc name. This specifies that you want the Attribution-Reporting-Eligible header sent to the same server as the href attribute points to. This is fine when you are handling the attribution source registration on the same server.
//Value containing one or more URLs, for example:
//HTML
//Copy to Clipboard
//attributionsrc="https://a.example/register-source
//https://b.example/register-source"
//This is useful in cases where the requested resource is not on a server you control, or you just want to handle registering the attribution source on a different server. In this case, you can specify one or more URLs as the value of attributionsrc. When the resource request occurs, the Attribution-Reporting-Eligible header will be sent to the URL(s) specified in attributionsrc in addition to the resource origin. These URLs can then respond with the Attribution-Reporting-Register-Source to complete registration.
//Note: Specifying multiple URLs means that multiple attribution sources can be registered on the same feature. You might for example have different campaigns that you are trying to measure the success of, which involve generating different reports on different data.
//<a> elements cannot be used as attribution triggers, only sources.
