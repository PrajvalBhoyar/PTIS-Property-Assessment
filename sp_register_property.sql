CREATE PROCEDURE PTIS.sp_RegisterProperty
(
    @OwnerID BIGINT,
    @UserID int
)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PTIS.PropertyAssessmentStatusTxn
    (OwnerID, StatusCode, PerformedBy)
    VALUES
    (@OwnerID, 'Register Property', @UserID);

    DECLARE @HistoryId BIGINT = SCOPE_IDENTITY();

    INSERT INTO PTIS.PropertyAssessment
    (OwnerID, CurrentStatusCode, CurrentStatusHistoryId, CreatedBy)
    VALUES
    (@OwnerID, 'Register Property', @HistoryId, @UserID);
END;
