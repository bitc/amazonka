{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Route53Domains.DisableDomainAutoRenew
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- This operation disables automatic renewal of domain registration for the
-- specified domain.
--
-- Caution! Amazon Route 53 doesn\'t have a manual renewal process, so if
-- you disable automatic renewal, registration for the domain will not be
-- renewed when the expiration date passes, and you will lose control of
-- the domain name.
--
-- <http://docs.aws.amazon.com/Route53/latest/APIReference/api-DisableDomainAutoRenew.html>
module Network.AWS.Route53Domains.DisableDomainAutoRenew
    (
    -- * Request
      DisableDomainAutoRenew
    -- ** Request constructor
    , disableDomainAutoRenew
    -- ** Request lenses
    , ddarrqDomainName

    -- * Response
    , DisableDomainAutoRenewResponse
    -- ** Response constructor
    , disableDomainAutoRenewResponse
    -- ** Response lenses
    , ddarrsStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.Route53Domains.Types

-- | /See:/ 'disableDomainAutoRenew' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ddarrqDomainName'
newtype DisableDomainAutoRenew = DisableDomainAutoRenew'
    { _ddarrqDomainName :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DisableDomainAutoRenew' smart constructor.
disableDomainAutoRenew :: Text -> DisableDomainAutoRenew
disableDomainAutoRenew pDomainName_ =
    DisableDomainAutoRenew'
    { _ddarrqDomainName = pDomainName_
    }

-- | FIXME: Undocumented member.
ddarrqDomainName :: Lens' DisableDomainAutoRenew Text
ddarrqDomainName = lens _ddarrqDomainName (\ s a -> s{_ddarrqDomainName = a});

instance AWSRequest DisableDomainAutoRenew where
        type Sv DisableDomainAutoRenew = Route53Domains
        type Rs DisableDomainAutoRenew =
             DisableDomainAutoRenewResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DisableDomainAutoRenewResponse' <$>
                   (pure (fromEnum s)))

instance ToHeaders DisableDomainAutoRenew where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("Route53Domains_v20140515.DisableDomainAutoRenew" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DisableDomainAutoRenew where
        toJSON DisableDomainAutoRenew'{..}
          = object ["DomainName" .= _ddarrqDomainName]

instance ToPath DisableDomainAutoRenew where
        toPath = const "/"

instance ToQuery DisableDomainAutoRenew where
        toQuery = const mempty

-- | /See:/ 'disableDomainAutoRenewResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ddarrsStatus'
newtype DisableDomainAutoRenewResponse = DisableDomainAutoRenewResponse'
    { _ddarrsStatus :: Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DisableDomainAutoRenewResponse' smart constructor.
disableDomainAutoRenewResponse :: Int -> DisableDomainAutoRenewResponse
disableDomainAutoRenewResponse pStatus_ =
    DisableDomainAutoRenewResponse'
    { _ddarrsStatus = pStatus_
    }

-- | FIXME: Undocumented member.
ddarrsStatus :: Lens' DisableDomainAutoRenewResponse Int
ddarrsStatus = lens _ddarrsStatus (\ s a -> s{_ddarrsStatus = a});