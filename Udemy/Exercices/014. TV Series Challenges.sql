-- #1

select s.title, r.rating from series s
join reviews r on r.series_id = s.id
order by title, rating desc;

-- #2

select title, round(avg(rating), 2) as avg_rating from series
join reviews on reviews.series_id = series.id
group by title
order by avg_rating;

-- #3

select first_name, last_name, rating from reviewers
join reviews on reviews.reviewer_id = reviewers.id;

-- #4

select title as unreviewed_series from series
left join reviews on reviews.series_id = series.id
where rating IS NULL;