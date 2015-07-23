{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Glacier.ListJobs
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- This operation lists jobs for a vault, including jobs that are
-- in-progress and jobs that have recently finished.
--
-- Amazon Glacier retains recently completed jobs for a period before
-- deleting them; however, it eventually removes completed jobs. The output
-- of completed jobs can be retrieved. Retaining completed jobs for a
-- period of time after they have completed enables you to get a job output
-- in the event you miss the job completion notification or your first
-- attempt to download it fails. For example, suppose you start an archive
-- retrieval job to download an archive. After the job completes, you start
-- to download the archive but encounter a network error. In this scenario,
-- you can retry and download the archive while the job exists.
--
-- To retrieve an archive or retrieve a vault inventory from Amazon
-- Glacier, you first initiate a job, and after the job completes, you
-- download the data. For an archive retrieval, the output is the archive
-- data, and for an inventory retrieval, it is the inventory list. The List
-- Job operation returns a list of these jobs sorted by job initiation
-- time.
--
-- This List Jobs operation supports pagination. By default, this operation
-- returns up to 1,000 jobs in the response. You should always check the
-- response for a @marker@ at which to continue the list; if there are no
-- more items the @marker@ is @null@. To return a list of jobs that begins
-- at a specific job, set the @marker@ request parameter to the value you
-- obtained from a previous List Jobs request. You can also limit the
-- number of jobs returned in the response by specifying the @limit@
-- parameter in the request.
--
-- Additionally, you can filter the jobs list returned by specifying an
-- optional @statuscode@ (InProgress, Succeeded, or Failed) and @completed@
-- (true, false) parameter. The @statuscode@ allows you to specify that
-- only jobs that match a specified status are returned. The @completed@
-- parameter allows you to specify that only jobs in a specific completion
-- state are returned.
--
-- An AWS account has full permission to perform all operations (actions).
-- However, AWS Identity and Access Management (IAM) users don\'t have any
-- permissions by default. You must grant them explicit permission to
-- perform specific actions. For more information, see
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html Access Control Using AWS Identity and Access Management (IAM)>.
--
-- For the underlying REST API, go to
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/api-jobs-get.html List Jobs>
--
-- <http://docs.aws.amazon.com/amazonglacier/latest/dev/api-ListJobs.html>
module Network.AWS.Glacier.ListJobs
    (
    -- * Request
      ListJobs
    -- ** Request constructor
    , listJobs
    -- ** Request lenses
    , ljrqMarker
    , ljrqCompleted
    , ljrqLimit
    , ljrqStatuscode
    , ljrqAccountId
    , ljrqVaultName

    -- * Response
    , ListJobsResponse
    -- ** Response constructor
    , listJobsResponse
    -- ** Response lenses
    , ljrsMarker
    , ljrsJobList
    , ljrsStatus
    ) where

import           Network.AWS.Glacier.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Provides options for retrieving a job list for an Amazon Glacier vault.
--
-- /See:/ 'listJobs' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ljrqMarker'
--
-- * 'ljrqCompleted'
--
-- * 'ljrqLimit'
--
-- * 'ljrqStatuscode'
--
-- * 'ljrqAccountId'
--
-- * 'ljrqVaultName'
data ListJobs = ListJobs'
    { _ljrqMarker     :: !(Maybe Text)
    , _ljrqCompleted  :: !(Maybe Text)
    , _ljrqLimit      :: !(Maybe Text)
    , _ljrqStatuscode :: !(Maybe Text)
    , _ljrqAccountId  :: !Text
    , _ljrqVaultName  :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ListJobs' smart constructor.
listJobs :: Text -> Text -> ListJobs
listJobs pAccountId_ pVaultName_ =
    ListJobs'
    { _ljrqMarker = Nothing
    , _ljrqCompleted = Nothing
    , _ljrqLimit = Nothing
    , _ljrqStatuscode = Nothing
    , _ljrqAccountId = pAccountId_
    , _ljrqVaultName = pVaultName_
    }

-- | An opaque string used for pagination. This value specifies the job at
-- which the listing of jobs should begin. Get the marker value from a
-- previous List Jobs response. You need only include the marker if you are
-- continuing the pagination of results started in a previous List Jobs
-- request.
ljrqMarker :: Lens' ListJobs (Maybe Text)
ljrqMarker = lens _ljrqMarker (\ s a -> s{_ljrqMarker = a});

-- | Specifies the state of the jobs to return. You can specify @true@ or
-- @false@.
ljrqCompleted :: Lens' ListJobs (Maybe Text)
ljrqCompleted = lens _ljrqCompleted (\ s a -> s{_ljrqCompleted = a});

-- | Specifies that the response be limited to the specified number of items
-- or fewer. If not specified, the List Jobs operation returns up to 1,000
-- jobs.
ljrqLimit :: Lens' ListJobs (Maybe Text)
ljrqLimit = lens _ljrqLimit (\ s a -> s{_ljrqLimit = a});

-- | Specifies the type of job status to return. You can specify the
-- following values: \"InProgress\", \"Succeeded\", or \"Failed\".
ljrqStatuscode :: Lens' ListJobs (Maybe Text)
ljrqStatuscode = lens _ljrqStatuscode (\ s a -> s{_ljrqStatuscode = a});

-- | The @AccountId@ value is the AWS account ID of the account that owns the
-- vault. You can either specify an AWS account ID or optionally a single
-- apos@-@apos (hyphen), in which case Amazon Glacier uses the AWS account
-- ID associated with the credentials used to sign the request. If you use
-- an account ID, do not include any hyphens (apos-apos) in the ID.
ljrqAccountId :: Lens' ListJobs Text
ljrqAccountId = lens _ljrqAccountId (\ s a -> s{_ljrqAccountId = a});

-- | The name of the vault.
ljrqVaultName :: Lens' ListJobs Text
ljrqVaultName = lens _ljrqVaultName (\ s a -> s{_ljrqVaultName = a});

instance AWSRequest ListJobs where
        type Sv ListJobs = Glacier
        type Rs ListJobs = ListJobsResponse
        request = get
        response
          = receiveJSON
              (\ s h x ->
                 ListJobsResponse' <$>
                   (x .?> "Marker") <*> (x .?> "JobList" .!@ mempty) <*>
                     (pure (fromEnum s)))

instance ToHeaders ListJobs where
        toHeaders = const mempty

instance ToPath ListJobs where
        toPath ListJobs'{..}
          = mconcat
              ["/", toText _ljrqAccountId, "/vaults/",
               toText _ljrqVaultName, "/jobs"]

instance ToQuery ListJobs where
        toQuery ListJobs'{..}
          = mconcat
              ["marker" =: _ljrqMarker,
               "completed" =: _ljrqCompleted, "limit" =: _ljrqLimit,
               "statuscode" =: _ljrqStatuscode]

-- | Contains the Amazon Glacier response to your request.
--
-- /See:/ 'listJobsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ljrsMarker'
--
-- * 'ljrsJobList'
--
-- * 'ljrsStatus'
data ListJobsResponse = ListJobsResponse'
    { _ljrsMarker  :: !(Maybe Text)
    , _ljrsJobList :: !(Maybe [GlacierJobDescription])
    , _ljrsStatus  :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ListJobsResponse' smart constructor.
listJobsResponse :: Int -> ListJobsResponse
listJobsResponse pStatus_ =
    ListJobsResponse'
    { _ljrsMarker = Nothing
    , _ljrsJobList = Nothing
    , _ljrsStatus = pStatus_
    }

-- | An opaque string that represents where to continue pagination of the
-- results. You use this value in a new List Jobs request to obtain more
-- jobs in the list. If there are no more jobs, this value is @null@.
ljrsMarker :: Lens' ListJobsResponse (Maybe Text)
ljrsMarker = lens _ljrsMarker (\ s a -> s{_ljrsMarker = a});

-- | A list of job objects. Each job object contains metadata describing the
-- job.
ljrsJobList :: Lens' ListJobsResponse [GlacierJobDescription]
ljrsJobList = lens _ljrsJobList (\ s a -> s{_ljrsJobList = a}) . _Default;

-- | FIXME: Undocumented member.
ljrsStatus :: Lens' ListJobsResponse Int
ljrsStatus = lens _ljrsStatus (\ s a -> s{_ljrsStatus = a});