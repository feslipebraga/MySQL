-- #1
select
    s.title,
    r.rating
from
    series s
    join reviews r on r.series_id = s.id
order by
    title,
    rating desc;

-- #2
select
    title,
    round(avg(rating), 2) as avg_rating
from
    series
    join reviews on reviews.series_id = series.id
group by
    title
order by
    avg_rating;

-- #3
select
    first_name,
    last_name,
    rating
from
    reviewers
    join reviews on reviews.reviewer_id = reviewers.id;

-- #4
select
    title as unreviewed_series
from
    series
    left join reviews on reviews.series_id = series.id
where
    rating IS NULL;

-- #5
select
    genre,
    round(avg(rating), 2) as avg_rating
from
    series
    join reviews on reviews.series_id = series.id
group by
    genre;

-- #6
select
    first_name,
    last_name,
    count(rating) AS COUNT,
    ifnull(min(rating), 0) AS MIN,
    ifnull(max(rating), 0) AS MAX,
    ifnull(round(avg(rating), 2), 0) AS AVG,
    case
        when count(rating) > 0 then 'ACTIVE'
        when count(rating) >= 10 then 'POWERUSER'
        else 'INACTIVE'
    end as STATUS
from
    reviewers
    left join reviews on reviews.reviewer_id = reviewers.id
group by
    first_name,
    last_name;

-- #7
select
    title,
    rating,
    concat(first_name, ' ', last_name) as reviewer
from
    series
    join reviews on reviews.series_id = series.id
    join reviewers on reviews.reviewer_id = reviewers.id
order by
    title;