//
//  SpeakersPresenter.swift
//  CSRSpeakers
//
//  Created by apple on 8/5/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation
    
    //MARK:- this protocol to be fired by presenter in view controller
    public protocol SpeakersView: class {
        func showLoading() // show loader
        func hideLoading() // hide loader
        func showLoadError(message: String)  // show  error loading message
        func showLoginError(message: String) // show  login error message
        func showNoInternetConnectionError() // to show internet toast if there is no internet connection
        func showSpeakersData(response: SpeakersResponse)
    }
    
    public class SpeakersPresenter {
        
        fileprivate weak var speakersView : SpeakersView?
        fileprivate let homeGateway: HomeGateway
        
        init(homeGateway: HomeGateway) {
            self.homeGateway = homeGateway
        }
        
        // this initialize the presenter view methods
        func setView(view: SpeakersView) {
            speakersView = view
        }
    }
    
    extension SpeakersPresenter {
        
        public func getSpeakers() {

                speakersView?.showLoading()
                homeGateway.getSpeakers() { [weak self] (networkReply, statusCode, response) in
                    switch(networkReply) {
                    case .success:
                        switch statusCode {
                        case 200:
                            self?.speakersView?.hideLoading()
                            self?.speakersView?.showSpeakersData(response: response!)
                            
                        default:
                            self?.speakersView?.hideLoading()
                            self?.speakersView?.showLoginError(message: "Something went wrong, Please try again")
                            break
                        }
                    case .failure:
                        self?.speakersView?.hideLoading()
                        self?.speakersView?.showLoadError(message: "Something went wrong, Please try again")
                        break
                    }
                }
        }
    }
