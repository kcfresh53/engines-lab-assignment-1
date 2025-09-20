# Engine Lab Assignment 1
## Adventure Island <1h recreation

You move around with the arrow keys to avoid enemies, jump with space, and throw a hammer using the "z" key.

## Diagram

```mermaid
classDiagram
	class Player {
		+move()
		+jump()
		+throwHammer()
		+die()
	}

	class Camera {
		+follow(player)
	}

	class EnemySpawner {
		+spawnEnemy()
		+trackCamera()
	}

	class Enemy {
		+move()
		+die()
	}

	class UI {
		+updateScore()
		+updateLives()
	}

	class TitleScreen {
		+slideAnimation()
	}

	%% Relationships
	Player --> Camera : "follow"
	Camera --> EnemySpawner : "drives spawn"
	EnemySpawner --> Enemy : "creates"
	Player --> Enemy : "collides with"
	Player --> UI : "updates via singleton"
	Enemy --> UI : "updates score"
	TitleScreen --> Player : "entry point"
```

## Answers

* Live tracking and score tracking use the **Singleton design pattern**.
* Depending on the setup of user interfaces or other interaction systems, it can be useful. In my case, I made use of it for GUI updates to prevent reference tracking to update labels.

---

*Kenechukwu Ozoemene - 100841149*

Assets used are modified variants of files found at: https://www.spriters-resource.com/nes/advisle/
