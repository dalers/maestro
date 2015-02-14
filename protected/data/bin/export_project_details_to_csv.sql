SELECT 
    DATE_FORMAT(Activities.RunDate, '%Y-%m-%d') As RunDate,
    Projects.JobID,
    Clients.ClientName,
    Activities.Type
--    DATE_FORMAT(Activities.StartDate, '%Y-%m-%d') As StartDate,
--    DATE_FORMAT(Activities.EndDate, '%Y-%m-%d') As EndDate,
--    TIMESTAMPDIFF(WEEK, CURDATE(), RunDate) AS WeeksToRun
FROM
    Projects,
    Activities,
    Clients
WHERE
    (Activities.ProjectID = Projects.ID) AND (Projects.ClientID = Clients.ID)
		AND (Activities.Type = ("M") OR Activities.Type = ("G") OR Activities.Type = ("D") OR Activities.Type = ("P") OR Activities.Type = ("B"))
--		AND Activities.RunDate BETWEEN DATE_SUB(NOW(), INTERVAL 2 WEEK) AND DATE_ADD(NOW(), INTERVAL 5 WEEK)
ORDER BY Projects.JobID;