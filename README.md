# Testing

## Full backup

Full backup is available in ms sql out of box.

## Diff backup

Diff backup is available in ms sql out of box.

## Incremental backup

To implement incremental backup, I've tried to make binary diff between differencial backups. I realize that from binary point of view, it might happen that semantically similar files would be completely different, but it turned out that binary diff is is fact super small, so I decided in scope of homework to proceed with this approach.

## Reverse Delta baclup

Similarly to inremental backup, I'm keeping binary diff between newer and older db

## CDP backup

Actually ms sql has a mechanism for cdp backup available in enterprise distribution, but since I'm using the free version, this approach could be achieved via Change Data Capture mechanism, but I wasted quite a lot of time running into ms sql specific erros (at least I think so) and let it go


| Mechanism            | Size (1-5)             | Ability to Roll Back (1-5)       | Speed of Roll Back (1-5)       | Cost (1-5)             |
|----------------------|------------------------|----------------------------------|--------------------------------|------------------------|
| Full Backup          | 3 (Average size)       | 4 (Good rollback ability)        | 1 (Slow rollback)              | 2 (Moderate cost)      |
| Differential Backup  | 5 (Large size)         | 2 (Fair rollback ability)        | 2 (Moderate rollback speed)    | 4 (Moderate cost)      |
| Incremental Backup   | 2 (Small size)         | 1 (Limited rollback ability)     | 4 (Fast rollback)              | 5 (Cost-effective)     |
| Reverse Delta Backup | 3 (Moderate size)      | 3 (Good rollback ability)        | 3 (Quick rollback)             | 3 (Moderate cost)      |
| CDP                  | 1 (Very large size)    | 5 (Excellent rollback ability)   | 5 (Ultra-fast rollback)        | 1 (High cost)          |

Some explanations:
In ms sql I essentially use two types of "native" backups: full and differential. The binary diff/patch is fast, and costs quite little, but backup methods that use binary diff/patches are just derived from base ones: so in terms of speed no "derived" ones can be faster, since we have to make a series of actions before we backing db up, or restoring it. On the contrary, in terms of size - the "derivad" ones are way more efficiend. The cost would depend on a specific infrastracture providers, but overall I've tried to take into account (roughly) processed data volume, computational power, traffic and storage size.
