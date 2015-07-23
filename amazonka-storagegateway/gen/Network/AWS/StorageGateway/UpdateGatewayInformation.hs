{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.StorageGateway.UpdateGatewayInformation
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- This operation updates a gateway\'s metadata, which includes the
-- gateway\'s name and time zone. To specify which gateway to update, use
-- the Amazon Resource Name (ARN) of the gateway in your request.
--
-- <http://docs.aws.amazon.com/storagegateway/latest/APIReference/API_UpdateGatewayInformation.html>
module Network.AWS.StorageGateway.UpdateGatewayInformation
    (
    -- * Request
      UpdateGatewayInformation
    -- ** Request constructor
    , updateGatewayInformation
    -- ** Request lenses
    , ugirqGatewayName
    , ugirqGatewayTimezone
    , ugirqGatewayARN

    -- * Response
    , UpdateGatewayInformationResponse
    -- ** Response constructor
    , updateGatewayInformationResponse
    -- ** Response lenses
    , ugirsGatewayARN
    , ugirsStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.StorageGateway.Types

-- | /See:/ 'updateGatewayInformation' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ugirqGatewayName'
--
-- * 'ugirqGatewayTimezone'
--
-- * 'ugirqGatewayARN'
data UpdateGatewayInformation = UpdateGatewayInformation'
    { _ugirqGatewayName     :: !(Maybe Text)
    , _ugirqGatewayTimezone :: !(Maybe Text)
    , _ugirqGatewayARN      :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'UpdateGatewayInformation' smart constructor.
updateGatewayInformation :: Text -> UpdateGatewayInformation
updateGatewayInformation pGatewayARN_ =
    UpdateGatewayInformation'
    { _ugirqGatewayName = Nothing
    , _ugirqGatewayTimezone = Nothing
    , _ugirqGatewayARN = pGatewayARN_
    }

-- | FIXME: Undocumented member.
ugirqGatewayName :: Lens' UpdateGatewayInformation (Maybe Text)
ugirqGatewayName = lens _ugirqGatewayName (\ s a -> s{_ugirqGatewayName = a});

-- | FIXME: Undocumented member.
ugirqGatewayTimezone :: Lens' UpdateGatewayInformation (Maybe Text)
ugirqGatewayTimezone = lens _ugirqGatewayTimezone (\ s a -> s{_ugirqGatewayTimezone = a});

-- | FIXME: Undocumented member.
ugirqGatewayARN :: Lens' UpdateGatewayInformation Text
ugirqGatewayARN = lens _ugirqGatewayARN (\ s a -> s{_ugirqGatewayARN = a});

instance AWSRequest UpdateGatewayInformation where
        type Sv UpdateGatewayInformation = StorageGateway
        type Rs UpdateGatewayInformation =
             UpdateGatewayInformationResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 UpdateGatewayInformationResponse' <$>
                   (x .?> "GatewayARN") <*> (pure (fromEnum s)))

instance ToHeaders UpdateGatewayInformation where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("StorageGateway_20130630.UpdateGatewayInformation"
                       :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON UpdateGatewayInformation where
        toJSON UpdateGatewayInformation'{..}
          = object
              ["GatewayName" .= _ugirqGatewayName,
               "GatewayTimezone" .= _ugirqGatewayTimezone,
               "GatewayARN" .= _ugirqGatewayARN]

instance ToPath UpdateGatewayInformation where
        toPath = const "/"

instance ToQuery UpdateGatewayInformation where
        toQuery = const mempty

-- | A JSON object containing the of the gateway that was updated.
--
-- /See:/ 'updateGatewayInformationResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ugirsGatewayARN'
--
-- * 'ugirsStatus'
data UpdateGatewayInformationResponse = UpdateGatewayInformationResponse'
    { _ugirsGatewayARN :: !(Maybe Text)
    , _ugirsStatus     :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'UpdateGatewayInformationResponse' smart constructor.
updateGatewayInformationResponse :: Int -> UpdateGatewayInformationResponse
updateGatewayInformationResponse pStatus_ =
    UpdateGatewayInformationResponse'
    { _ugirsGatewayARN = Nothing
    , _ugirsStatus = pStatus_
    }

-- | FIXME: Undocumented member.
ugirsGatewayARN :: Lens' UpdateGatewayInformationResponse (Maybe Text)
ugirsGatewayARN = lens _ugirsGatewayARN (\ s a -> s{_ugirsGatewayARN = a});

-- | FIXME: Undocumented member.
ugirsStatus :: Lens' UpdateGatewayInformationResponse Int
ugirsStatus = lens _ugirsStatus (\ s a -> s{_ugirsStatus = a});