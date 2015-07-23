{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AutoScaling.TerminateInstanceInAutoScalingGroup
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Terminates the specified instance and optionally adjusts the desired
-- group size.
--
-- This call simply makes a termination request. The instances is not
-- terminated immediately.
--
-- <http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_TerminateInstanceInAutoScalingGroup.html>
module Network.AWS.AutoScaling.TerminateInstanceInAutoScalingGroup
    (
    -- * Request
      TerminateInstanceInAutoScalingGroup
    -- ** Request constructor
    , terminateInstanceInAutoScalingGroup
    -- ** Request lenses
    , tiiasgrqInstanceId
    , tiiasgrqShouldDecrementDesiredCapacity

    -- * Response
    , TerminateInstanceInAutoScalingGroupResponse
    -- ** Response constructor
    , terminateInstanceInAutoScalingGroupResponse
    -- ** Response lenses
    , tiiasgrsActivity
    , tiiasgrsStatus
    ) where

import           Network.AWS.AutoScaling.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'terminateInstanceInAutoScalingGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tiiasgrqInstanceId'
--
-- * 'tiiasgrqShouldDecrementDesiredCapacity'
data TerminateInstanceInAutoScalingGroup = TerminateInstanceInAutoScalingGroup'
    { _tiiasgrqInstanceId                     :: !Text
    , _tiiasgrqShouldDecrementDesiredCapacity :: !Bool
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'TerminateInstanceInAutoScalingGroup' smart constructor.
terminateInstanceInAutoScalingGroup :: Text -> Bool -> TerminateInstanceInAutoScalingGroup
terminateInstanceInAutoScalingGroup pInstanceId_ pShouldDecrementDesiredCapacity_ =
    TerminateInstanceInAutoScalingGroup'
    { _tiiasgrqInstanceId = pInstanceId_
    , _tiiasgrqShouldDecrementDesiredCapacity = pShouldDecrementDesiredCapacity_
    }

-- | The ID of the EC2 instance.
tiiasgrqInstanceId :: Lens' TerminateInstanceInAutoScalingGroup Text
tiiasgrqInstanceId = lens _tiiasgrqInstanceId (\ s a -> s{_tiiasgrqInstanceId = a});

-- | If @true@, terminating this instance also decrements the size of the
-- Auto Scaling group.
tiiasgrqShouldDecrementDesiredCapacity :: Lens' TerminateInstanceInAutoScalingGroup Bool
tiiasgrqShouldDecrementDesiredCapacity = lens _tiiasgrqShouldDecrementDesiredCapacity (\ s a -> s{_tiiasgrqShouldDecrementDesiredCapacity = a});

instance AWSRequest
         TerminateInstanceInAutoScalingGroup where
        type Sv TerminateInstanceInAutoScalingGroup =
             AutoScaling
        type Rs TerminateInstanceInAutoScalingGroup =
             TerminateInstanceInAutoScalingGroupResponse
        request = post
        response
          = receiveXMLWrapper
              "TerminateInstanceInAutoScalingGroupResult"
              (\ s h x ->
                 TerminateInstanceInAutoScalingGroupResponse' <$>
                   (x .@? "Activity") <*> (pure (fromEnum s)))

instance ToHeaders
         TerminateInstanceInAutoScalingGroup where
        toHeaders = const mempty

instance ToPath TerminateInstanceInAutoScalingGroup
         where
        toPath = const "/"

instance ToQuery TerminateInstanceInAutoScalingGroup
         where
        toQuery TerminateInstanceInAutoScalingGroup'{..}
          = mconcat
              ["Action" =:
                 ("TerminateInstanceInAutoScalingGroup" ::
                    ByteString),
               "Version" =: ("2011-01-01" :: ByteString),
               "InstanceId" =: _tiiasgrqInstanceId,
               "ShouldDecrementDesiredCapacity" =:
                 _tiiasgrqShouldDecrementDesiredCapacity]

-- | /See:/ 'terminateInstanceInAutoScalingGroupResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tiiasgrsActivity'
--
-- * 'tiiasgrsStatus'
data TerminateInstanceInAutoScalingGroupResponse = TerminateInstanceInAutoScalingGroupResponse'
    { _tiiasgrsActivity :: !(Maybe Activity)
    , _tiiasgrsStatus   :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'TerminateInstanceInAutoScalingGroupResponse' smart constructor.
terminateInstanceInAutoScalingGroupResponse :: Int -> TerminateInstanceInAutoScalingGroupResponse
terminateInstanceInAutoScalingGroupResponse pStatus_ =
    TerminateInstanceInAutoScalingGroupResponse'
    { _tiiasgrsActivity = Nothing
    , _tiiasgrsStatus = pStatus_
    }

-- | A scaling activity.
tiiasgrsActivity :: Lens' TerminateInstanceInAutoScalingGroupResponse (Maybe Activity)
tiiasgrsActivity = lens _tiiasgrsActivity (\ s a -> s{_tiiasgrsActivity = a});

-- | FIXME: Undocumented member.
tiiasgrsStatus :: Lens' TerminateInstanceInAutoScalingGroupResponse Int
tiiasgrsStatus = lens _tiiasgrsStatus (\ s a -> s{_tiiasgrsStatus = a});