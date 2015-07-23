{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.KMS.PutKeyPolicy
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Attaches a policy to the specified key.
--
-- <http://docs.aws.amazon.com/kms/latest/APIReference/API_PutKeyPolicy.html>
module Network.AWS.KMS.PutKeyPolicy
    (
    -- * Request
      PutKeyPolicy
    -- ** Request constructor
    , putKeyPolicy
    -- ** Request lenses
    , pkprqKeyId
    , pkprqPolicyName
    , pkprqPolicy

    -- * Response
    , PutKeyPolicyResponse
    -- ** Response constructor
    , putKeyPolicyResponse
    ) where

import           Network.AWS.KMS.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'putKeyPolicy' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pkprqKeyId'
--
-- * 'pkprqPolicyName'
--
-- * 'pkprqPolicy'
data PutKeyPolicy = PutKeyPolicy'
    { _pkprqKeyId      :: !Text
    , _pkprqPolicyName :: !Text
    , _pkprqPolicy     :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'PutKeyPolicy' smart constructor.
putKeyPolicy :: Text -> Text -> Text -> PutKeyPolicy
putKeyPolicy pKeyId_ pPolicyName_ pPolicy_ =
    PutKeyPolicy'
    { _pkprqKeyId = pKeyId_
    , _pkprqPolicyName = pPolicyName_
    , _pkprqPolicy = pPolicy_
    }

-- | A unique identifier for the customer master key. This value can be a
-- globally unique identifier or the fully specified ARN to a key.
--
-- -   Key ARN Example -
--     arn:aws:kms:us-east-1:123456789012:key\/12345678-1234-1234-1234-123456789012
-- -   Globally Unique Key ID Example -
--     12345678-1234-1234-1234-123456789012
pkprqKeyId :: Lens' PutKeyPolicy Text
pkprqKeyId = lens _pkprqKeyId (\ s a -> s{_pkprqKeyId = a});

-- | Name of the policy to be attached. Currently, the only supported name is
-- \"default\".
pkprqPolicyName :: Lens' PutKeyPolicy Text
pkprqPolicyName = lens _pkprqPolicyName (\ s a -> s{_pkprqPolicyName = a});

-- | The policy, in JSON format, to be attached to the key.
pkprqPolicy :: Lens' PutKeyPolicy Text
pkprqPolicy = lens _pkprqPolicy (\ s a -> s{_pkprqPolicy = a});

instance AWSRequest PutKeyPolicy where
        type Sv PutKeyPolicy = KMS
        type Rs PutKeyPolicy = PutKeyPolicyResponse
        request = postJSON
        response = receiveNull PutKeyPolicyResponse'

instance ToHeaders PutKeyPolicy where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("TrentService.PutKeyPolicy" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON PutKeyPolicy where
        toJSON PutKeyPolicy'{..}
          = object
              ["KeyId" .= _pkprqKeyId,
               "PolicyName" .= _pkprqPolicyName,
               "Policy" .= _pkprqPolicy]

instance ToPath PutKeyPolicy where
        toPath = const "/"

instance ToQuery PutKeyPolicy where
        toQuery = const mempty

-- | /See:/ 'putKeyPolicyResponse' smart constructor.
data PutKeyPolicyResponse =
    PutKeyPolicyResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'PutKeyPolicyResponse' smart constructor.
putKeyPolicyResponse :: PutKeyPolicyResponse
putKeyPolicyResponse = PutKeyPolicyResponse'