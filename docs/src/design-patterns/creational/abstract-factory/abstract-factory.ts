
interface Door {
	getDescription(): void;
}

class WoodenDoor implements Door
{
	public function getDescription() {
		console.log("I am a wooden door");
	}
}
