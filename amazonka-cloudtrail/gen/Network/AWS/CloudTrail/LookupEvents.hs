{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CloudTrail.LookupEvents
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Looks up API activity events captured by CloudTrail that create, update,
-- or delete resources in your account. Events for a region can be looked
-- up for the times in which you had CloudTrail turned on in that region
-- during the last seven days. Lookup supports five different attributes:
-- time range (defined by a start time and end time), user name, event
-- name, resource type, and resource name. All attributes are optional. The
-- maximum number of attributes that can be specified in any one lookup
-- request are time range and one other attribute. The default number of
-- results returned is 10, with a maximum of 50 possible. The response
-- includes a token that you can use to get the next page of results. The
-- rate of lookup requests is limited to one per second per account.
--
-- Events that occurred during the selected time range will not be
-- available for lookup if CloudTrail logging was not enabled when the
-- events occurred.
--
-- <http://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_LookupEvents.html>
module Network.AWS.CloudTrail.LookupEvents
    (
    -- * Request
      LookupEvents
    -- ** Request constructor
    , lookupEvents
    -- ** Request lenses
    , lerqStartTime
    , lerqLookupAttributes
    , lerqNextToken
    , lerqEndTime
    , lerqMaxResults

    -- * Response
    , LookupEventsResponse
    -- ** Response constructor
    , lookupEventsResponse
    -- ** Response lenses
    , lersNextToken
    , lersEvents
    , lersStatus
    ) where

import           Network.AWS.CloudTrail.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains a request for LookupEvents.
--
-- /See:/ 'lookupEvents' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lerqStartTime'
--
-- * 'lerqLookupAttributes'
--
-- * 'lerqNextToken'
--
-- * 'lerqEndTime'
--
-- * 'lerqMaxResults'
data LookupEvents = LookupEvents'
    { _lerqStartTime        :: !(Maybe POSIX)
    , _lerqLookupAttributes :: !(Maybe [LookupAttribute])
    , _lerqNextToken        :: !(Maybe Text)
    , _lerqEndTime          :: !(Maybe POSIX)
    , _lerqMaxResults       :: !(Maybe Nat)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'LookupEvents' smart constructor.
lookupEvents :: LookupEvents
lookupEvents =
    LookupEvents'
    { _lerqStartTime = Nothing
    , _lerqLookupAttributes = Nothing
    , _lerqNextToken = Nothing
    , _lerqEndTime = Nothing
    , _lerqMaxResults = Nothing
    }

-- | Specifies that only events that occur after or at the specified time are
-- returned. If the specified start time is after the specified end time,
-- an error is returned.
lerqStartTime :: Lens' LookupEvents (Maybe UTCTime)
lerqStartTime = lens _lerqStartTime (\ s a -> s{_lerqStartTime = a}) . mapping _Time;

-- | Contains a list of lookup attributes. Currently the list can contain
-- only one item.
lerqLookupAttributes :: Lens' LookupEvents [LookupAttribute]
lerqLookupAttributes = lens _lerqLookupAttributes (\ s a -> s{_lerqLookupAttributes = a}) . _Default;

-- | The token to use to get the next page of results after a previous API
-- call. This token must be passed in with the same parameters that were
-- specified in the the original call. For example, if the original call
-- specified an AttributeKey of \'Username\' with a value of \'root\', the
-- call with NextToken should include those same parameters.
lerqNextToken :: Lens' LookupEvents (Maybe Text)
lerqNextToken = lens _lerqNextToken (\ s a -> s{_lerqNextToken = a});

-- | Specifies that only events that occur before or at the specified time
-- are returned. If the specified end time is before the specified start
-- time, an error is returned.
lerqEndTime :: Lens' LookupEvents (Maybe UTCTime)
lerqEndTime = lens _lerqEndTime (\ s a -> s{_lerqEndTime = a}) . mapping _Time;

-- | The number of events to return. Possible values are 1 through 50. The
-- default is 10.
lerqMaxResults :: Lens' LookupEvents (Maybe Natural)
lerqMaxResults = lens _lerqMaxResults (\ s a -> s{_lerqMaxResults = a}) . mapping _Nat;

instance AWSRequest LookupEvents where
        type Sv LookupEvents = CloudTrail
        type Rs LookupEvents = LookupEventsResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 LookupEventsResponse' <$>
                   (x .?> "NextToken") <*> (x .?> "Events" .!@ mempty)
                     <*> (pure (fromEnum s)))

instance ToHeaders LookupEvents where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101.LookupEvents"
                       :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON LookupEvents where
        toJSON LookupEvents'{..}
          = object
              ["StartTime" .= _lerqStartTime,
               "LookupAttributes" .= _lerqLookupAttributes,
               "NextToken" .= _lerqNextToken,
               "EndTime" .= _lerqEndTime,
               "MaxResults" .= _lerqMaxResults]

instance ToPath LookupEvents where
        toPath = const "/"

instance ToQuery LookupEvents where
        toQuery = const mempty

-- | Contains a response to a LookupEvents action.
--
-- /See:/ 'lookupEventsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lersNextToken'
--
-- * 'lersEvents'
--
-- * 'lersStatus'
data LookupEventsResponse = LookupEventsResponse'
    { _lersNextToken :: !(Maybe Text)
    , _lersEvents    :: !(Maybe [Event])
    , _lersStatus    :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'LookupEventsResponse' smart constructor.
lookupEventsResponse :: Int -> LookupEventsResponse
lookupEventsResponse pStatus_ =
    LookupEventsResponse'
    { _lersNextToken = Nothing
    , _lersEvents = Nothing
    , _lersStatus = pStatus_
    }

-- | The token to use to get the next page of results after a previous API
-- call. If the token does not appear, there are no more results to return.
-- The token must be passed in with the same parameters as the previous
-- call. For example, if the original call specified an AttributeKey of
-- \'Username\' with a value of \'root\', the call with NextToken should
-- include those same parameters.
lersNextToken :: Lens' LookupEventsResponse (Maybe Text)
lersNextToken = lens _lersNextToken (\ s a -> s{_lersNextToken = a});

-- | A list of events returned based on the lookup attributes specified and
-- the CloudTrail event. The events list is sorted by time. The most recent
-- event is listed first.
lersEvents :: Lens' LookupEventsResponse [Event]
lersEvents = lens _lersEvents (\ s a -> s{_lersEvents = a}) . _Default;

-- | FIXME: Undocumented member.
lersStatus :: Lens' LookupEventsResponse Int
lersStatus = lens _lersStatus (\ s a -> s{_lersStatus = a});