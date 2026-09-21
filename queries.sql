-- Query 1: Find deals with no logged activity, or none in the last 30 days
-- (LEFT JOIN antijoin pattern — surfaces neglected deals, not just old ones)
SELECT Deals.ID, Deals.Name, MAX(Activities.Date) AS LastActivityDate
FROM Deals
LEFT JOIN Activities ON Deals.ID = Activities.deal_id
GROUP BY Deals.ID
HAVING MAX(Activities.Date) IS NULL
    OR julianday('now') - julianday(MAX(Activities.Date)) > 30;

-- Query 2: Find each company's largest deal
-- (correlated subquery — ties Name and Value to the same row, unlike a plain GROUP BY)
SELECT Companies.Name, Deals.Name, Deals.Value
FROM Companies
JOIN Contacts ON Companies.ID = Contacts.Company_id
JOIN Deals ON Contacts.ID = Deals.Contact_id
WHERE Deals.Value = (
    SELECT MAX(D2.Value)
    FROM Deals D2
    JOIN Contacts C2 ON D2.Contact_id = C2.ID
    WHERE C2.Company_id = Companies.ID
);

-- Query 3: Find deals priced above their own company's average deal value
-- (same correlated subquery pattern, using AVG instead of MAX)
SELECT Companies.Name, Deals.Name, Deals.Value
FROM Companies
JOIN Contacts ON Companies.ID = Contacts.Company_id
JOIN Deals ON Contacts.ID = Deals.Contact_id
WHERE Deals.Value > (
    SELECT AVG(D2.Value)
    FROM Deals D2
    JOIN Contacts C2 ON D2.Contact_id = C2.ID
    WHERE C2.Company_id = Companies.ID
);

-- Query 4: Find companies with 2 or more deals still in progress
-- (GROUP BY + HAVING, filtering rows with WHERE before grouping)
SELECT Companies.Name, COUNT(*) AS open_deal_count
FROM Companies
JOIN Contacts ON Companies.ID = Contacts.Company_id
JOIN Deals ON Contacts.ID = Deals.Contact_id
WHERE Deals.Stage NOT IN ('Closed Lost', 'Closed Won')
GROUP BY Companies.Name
HAVING COUNT(*) >= 2;
